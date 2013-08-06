class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :team
  belongs_to :permission

  scope :assignees, -> { where(:role_id => [ 1, 4 ]) }
  scope :reporters, -> { where(:role_id => [ 2, 4 ]) }
  scope :commenters, -> { where(:role_id => [ 3, 4 ]) }
   # all users except for the "nobody"/"unassigned" user at id: 1
  scope :reals, -> { where 'id > 1' }

  has_many :assignments, :class_name => "Task", :foreign_key => :assignee_id
  has_many :reported, :class_name => "Task", :foreign_key => :reporter_id
  has_many :comments, :class_name => "Comment", :foreign_key => :commenter_id
  has_many :commented, :class_name => "Task", :through => :comments, :source => :task

  validates :username,
            :presence => { :message => "Every user must have a username!" },
            :uniqueness => { :message => "Every user's username must be unique!" },
            :on => :create

  validates :first_name, :presence => { :message => "Every user must have a first name!" }, :on => :save
  validates :last_name, :presence => { :message => "Every user must have a last name!" }, :on => :save
  validates :role, :presence => { :message => "Every user must be associated with a role!" }, :on => :save
  validates :team, :presence => { :message => "Every user must be associated with a team!" }, :on => :save
  validates :permission, :presence => { :message => "Every user must be associated with permissions!" }, :on => :save

  def is_nobody?
  	id == 1
  end

  def self.nobody
    User.find(1)
  end

  # only authentication needed for this app is that
  # a proper username is chosen as current user
  def self.authenticate(username)
    User.find_by(:username => username)
  end

end
