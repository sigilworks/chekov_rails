class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :commenter
end
