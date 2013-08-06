class Comment < ActiveRecord::Base
  include Auditable

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

  def is_edited
    updated_at > created_at
  end

  # when a task with `new` status gets its first comment,
  # its status gets promoted to `open`...
  def assess_task_status
    TaskPromotionStrategy.assess(self.task)
  end

end
