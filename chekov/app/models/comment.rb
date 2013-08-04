class Comment < ActiveRecord::Base

  belongs_to :task, :touch => true, :autosave => true
  belongs_to :commenter, :class_name => "User"

  after_validation :assess_task_status

  accepts_nested_attributes_for :task, :update_only => true

  validates :task,
  			:presence =>  { :message => "Every comment must be associated with a task!" },
  			:on => :save
  validates :commenter,
  			:presence => { :message => "Every comment must be associated with a commenter!" },
  			:on => :save

  after_save :queue_change_activity
  after_destroy :queue_destroy_activity

  def is_edited
    updated_at > created_at
  end

  # when a task with `new` status gets its first comment,
  # its status gets promoted to `open`...
  def assess_task_status
    TaskPromotionStrategy.assess(self.task)
  end

  def queue_change_activity
    if self.created_at_was.nil?
      QueueService.created_comment(self.id, self.attributes)
    elsif self.updated_at > self.updated_at_was
      QueueService.updated_comment(self.id, self.attributes)
    end
  end

  def queue_destroy_activity
    QueueService.deleted_comment(self.id, self.attributes)
  end

end
