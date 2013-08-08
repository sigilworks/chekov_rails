
module RolePermissionsStrategy
  extend self

  def for_user(user)
    RolePermissionsMatrix.new(user)
  end

  # Permission:: 'ADMIN', 'READ_ONLY', 'ADD_ONLY'
  # Role:: 'ASSIGNEE', 'REPORTER', 'COMMENTER', 'ANY'
  # Team:: 'PRODUCT', 'DEVELOPMENT', 'OPS', 'MGMT', 'OTHER'

  class RolePermissionsMatrix

    def initialize(user)
      @user = user
      @permission, @role, @team = user.permission, user.role, user.team
    end

    # New Task:
    #   - anyone (non-readonly) can enter new tasks
    def new_task?
      is_all_except_readonly?
    end
    # Edit Task:
    #   - anyone (non-readonly) can edit tasks (and shouldnt we track this somewhere?)
    def edit_task?(taskid)
      is_all_except_readonly?
    end
    # Assign/Change assignation of Task:
    #   - only admin
    def change_assignee?(taskid)
      is_admin?
    end
    # Change status of Task:
    #   - anyone (non-readonly, non-addonly)
    def change_status?(taskid)
      is_all_except_readonly_addonly?
    end
    # Delete Task:
    #   - only admin
    def delete_task?(taskid)
      is_admin?
    end
    # New Comment:
    #   - anyone (non-readonly) can enter new comments
    def new_comment?
      is_all_except_readonly?
    end
    # Edit Comment:
    #   - only admins && commenter can edit comments
    def edit_comment?(commentid)
      is_admin_or_commenter?(commentid)
    end
    # Delete Comment
    #   - only admins && commenter can delete comments
    def delete_comment?(commentid)
      is_admin_or_commenter?(commentid)
    end

  private

    def is_all_except_readonly?
      Permission.where.not(:id => Permission.READ_ONLY).include? @permission
    end

    def is_all_except_readonly_addonly?
      Permission.where.not(:id => [ Permission.READ_ONLY, Permission.ADD_ONLY ]).include? @permission
    end

    def is_admin?
      Permission.where(:id => Permission.ADMIN).include? @permission
    end

    def is_admin_or_commenter?(commentid)
      is_admin? || Comment.find(commentid).commenter == @user
    end

  end

end