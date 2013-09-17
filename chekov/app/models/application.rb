class Application < EnumableModel
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
