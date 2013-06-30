class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :team
  belongs_to :permission
end
