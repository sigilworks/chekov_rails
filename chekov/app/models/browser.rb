class Browser < ActiveRecord::Base
  validates :name, 
            :presence => { :message => "Every browser must have a name!" },
            :uniqueness => { :message => "Every browser's name must be unique!" },
            :on => :create
  validates :shortname, 
            :presence => { :message => "Every browser must have a shortname!" },
            :uniqueness => { :message => "Every browser's shortname must be unique!" },
            :on => :create
end
