class Team < ActiveRecord::Base
  validates :name, 
            :presence => { :message => "Every team must have a name!" },
            :uniqueness => { :message => "Every team's name must be unique!" },
            :on => :create
end
