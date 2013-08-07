
module RolePermissionsStrategy
  extend self

  def for_user(user)
    RolePermissionsMatrix.new(user.permission, user.role, user.team)
  end

  class RolePermissionsMatrix

    def initialize(permission, role, team)
      @permission, @role, @team = permission, role, team
    end

    def new_task?
    end

    def edit_task?(taskid)
    end

    def change_assignee?(taskid)
    end

    def change_status?(taskid)
    end

    def delete_task?(taskid)
    end

    def new_comment?
    end

    def edit_comment?(commentid)
    end

    def delete_comment?(commentid)
    end

  end

  # Permission:: 'ADMIN', 'READ_ONLY', 'ADD_ONLY'
  # Role:: 'ASSIGNEE', 'REPORTER', 'COMMENTER', 'ANY'
  # Team:: 'PRODUCT', 'DEVELOPMENT', 'OPS', 'MGMT', 'OTHER'

  #######  TASKS  #######
  # New Task:
  #   - anyone (non-readonly) can enter new tasks
  # Edit Task:
  #   - anyone (non-readonly) can edit tasks (and shouldnt we track this somewhere?)
  # Assign/Change assignation of Task:
  #   - only admin
  # Change status of Task:
  #   - anyone (non-readonly, non-addonly)
  # Delete Task:
  #   - only admin

  ########  COMMENTS  #######
  # New Comment:
  #   - anyone (non-readonly) can enter new comments
  # Edit Comment:
  #   - only admins && commenter can edit comments
  # Change status of Task from Comment:
  #   - anyone (non-readonly, non-addonly)
  # Delete Comment
  #   - only admins && commenter can delete comments

end