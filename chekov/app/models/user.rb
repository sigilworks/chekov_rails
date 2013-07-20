class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :team
  belongs_to :permission

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
