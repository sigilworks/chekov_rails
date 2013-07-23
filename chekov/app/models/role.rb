class Role < ActiveRecord::Base
  validates :name, 
            :presence => { :message => "Every role must have a name!" },
            :uniqueness => { :message => "Every role's name must be unique!" },
            :on => :create
end
