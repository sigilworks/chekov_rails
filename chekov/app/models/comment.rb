class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :commenter, class_name: "User"

  def is_edited
  	updated_at > created_at
  end

end
