class Task < ActiveRecord::Base
  include Auditable

  belongs_to :application
  belongs_to :reporter, :class_name => "User"
  belongs_to :assignee, :class_name => "User"
  belongs_to :status
  belongs_to :browser

  scope :by_reporter, ->(user) { where(:reporter => user).order(:id => :desc)  }
  scope :by_assignee, ->(user) { where(:assignee => user).order(:id => :desc) }
  scope :by_commenter, ->(user) { includes(:comments).where('commenter_id = ?', user.id).order(:id => :desc).references(:comments) }

  has_many :comments, :dependent => :destroy
  has_many :commenters, :through => :comments, :source => :commenter, :class_name => "User"

  validates :application, :presence => true, :on => :save
  validates :reporter, :presence => true, :on => :save

end