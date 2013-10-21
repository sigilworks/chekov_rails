class Task < ActiveRecord::Base
  include Auditable

  after_touch :assess_task_status

  belongs_to :application
  belongs_to :reporter, :class_name => "User"
  belongs_to :assignee, :class_name => "User"
  belongs_to :status
  belongs_to :browser

  scope :by_reporter, ->(user) { where(:reporter => user).order(:id => :desc)  }
  scope :by_assignee, ->(user) { where(:assignee => user).order(:id => :desc) }
  scope :by_commenter, ->(user) { includes(:comments).where(:comments => { :commenter => user }).order(:id => :desc).references(:comments) }

  has_many :comments, :dependent => :destroy, :before_add => :assess_before_add
  has_many :commenters, :through => :comments, :source => :commenter, :class_name => "User"

  validates :application, :presence => true, :on => :save
  validates :reporter, :presence => true, :on => :save
  validates :description, :presence => true, :on => :create


  private

  # when a task with previously assigned to User.nobody
  # gets a "real" assignee, its status gets promoted to `open`...
  def assess_task_status
    TaskPromotionStrategy.assess(self)
  end

  def assess_before_add
    binding.pry
  end

end