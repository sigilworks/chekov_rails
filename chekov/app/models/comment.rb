class Comment < ActiveRecord::Base
  include Auditable

  belongs_to :task, :touch => true, :autosave => true
  belongs_to :commenter, :class_name => "User"

  accepts_nested_attributes_for :task, :update_only => true

  validates :task, :presence => true, :on => :save
  validates :commenter, :presence => true, :on => :save
  validates :description, :presence => true, :on => :save

  def is_edited
    updated_at > created_at
  end

end
