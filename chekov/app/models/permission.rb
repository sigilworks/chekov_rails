class Permission < EnumableModel
  has_and_belongs_to_many :users
  validates :name, :presence => true, :uniqueness => true, :on => :create
end
