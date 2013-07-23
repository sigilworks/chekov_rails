class Application < ActiveRecord::Base
  validates :name, 
            :presence => { :message => "Every application must have a name!" },
            :uniqueness => { :message => "Every application's name must be unique!" },
            :on => :create
end
