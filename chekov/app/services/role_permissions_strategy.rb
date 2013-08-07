
module RolePermissionsStrategy
  extend self

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