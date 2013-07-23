class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :team
  belongs_to :permission

  validates :username, 
            :presence => { :message => "Every user must have a username!" },
            :uniqueness => { :message => "Every user's username must be unique!" },
            :on => :create

  validates :first_name, :presence => { :message => "Every user must have a first name!" }, :on => :save
  validates :last_name, :presence => { :message => "Every user must have a last name!" }, :on => :save
  validates :role, :presence => { :message => "Every user must be associated with a role!" }, :on => :save
  validates :team, :presence => { :message => "Every user must be associated with a team!" }, :on => :save
  validates :permission, :presence => { :message => "Every user must be associated with permissions!" }, :on => :save

  scope :assignees, -> { where(:role_id => [ 1, 4 ])}
  scope :reporters, -> { where(:role_id => [ 2, 4 ])}
  scope :commenters, -> { where(:role_id => [ 3, 4 ])}

  def self.nobody
    User.find(1)
  end

  def is_nobody?
  	id == 1
  end

end
