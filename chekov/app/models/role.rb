class Role < EnumableModel
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
