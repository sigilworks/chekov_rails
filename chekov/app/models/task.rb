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

  def is_promotable?
    self.comments.size == 0 && self.status_id == 3 # NEW
  end

  def promote!
    if self.status_id == 3 # NEW
      self.status_id = 2 # OPEN
    end
  end

end
