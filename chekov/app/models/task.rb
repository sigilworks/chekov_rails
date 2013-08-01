class Task < ActiveRecord::Base

  belongs_to :application
  belongs_to :reporter, :class_name => "User"
  belongs_to :assignee, :class_name => "User"
  belongs_to :status
  belongs_to :browser

  scope :by_reporter, ->(user) { where(:reporter => user).order(:id => :desc)  }
  scope :by_assignee, ->(user) { where(:assignee => user).order(:id => :desc) }
  scope :by_commenter, ->(user) { includes(:comments).where('commenter_id = ?', user.id).order(:id => :desc).references(:comments) }

  has_many   :comments, :dependent => :destroy

  validates :application,
            :presence => { :message => "Every task must be associated with an application!" },
            :on => :save
  validates :reporter,
            :presence => { :message => "Every task must be associated with a reporter!" },
            :on => :save
end