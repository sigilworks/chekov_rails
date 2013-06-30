class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :team
  belongs_to :permissions
  attr_accessible :first_name, :last_name, :username, :role_id, :team_id, :permissions_id
end

class Task < ActiveRecord::Base
  belongs_to :application
  belongs_to :reporter
  belongs_to :assignee
  belongs_to :status
  belongs_to :browser
  has_many   :comments
  attr_accessible :build_observed, :bz_id, :description, :application_id, :reporter_id, :assignee_id, :status_id, :browser_id
end

class Application < ActiveRecord::Base
  attr_accessible :name
end

class Status < ActiveRecord::Base
  attr_accessible :classname, :description, :name
end

class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :commenter
  attr_accessible :description, :task_id, :commenter_id
end

class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users
end
