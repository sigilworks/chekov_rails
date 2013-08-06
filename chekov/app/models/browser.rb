class Browser < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :on => :create
  validates :shortname, :presence => true, :uniqueness => true, :on => :create
end
