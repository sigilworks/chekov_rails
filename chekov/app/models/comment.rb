class Comment < ActiveRecord::Base

  belongs_to :task, :autosave => true, :touch => true
  belongs_to :commenter, :class_name => "User"

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

end
