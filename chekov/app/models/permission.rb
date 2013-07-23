class Permission < ActiveRecord::Base
  validates :name, 
            :presence => { :message => "Every permission must have a name!" },
            :uniqueness => { :message => "Every permission's name must be unique!" },
            :on => :create
end
