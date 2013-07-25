class Task < ActiveRecord::Base

  belongs_to :application
  belongs_to :reporter, :class_name => "User"
  belongs_to :assignee, :class_name => "User"
  belongs_to :status
  belongs_to :browser

  has_many   :comments, :dependent => :destroy

  validates :application,
            :presence => { :message => "Every task must be associated with an application!" },
            :on => :create
  validates :reporter,
            :presence => { :message => "Every task must be associated with a reporter!" },
            :on => :create
end
