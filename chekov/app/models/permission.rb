class Permission < EnumableModel # < ActiveRecord::Base
  # include Enumable
  has_and_belongs_to_many :users
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
