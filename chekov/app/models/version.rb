class Version < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
