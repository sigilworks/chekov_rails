
 1. Edit Task
 		- anyone can edit tasks (and shouldnt we track this somewhere?)

 2.	Edit Comment
 		- only admins && commenter can edit comments
 		- only admins && commenter can delete comments
 		(^^ probably need a Permissions/RoleService or -Strategy for these too)

 3. task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 4.	make .meta icons darker (maybe opacity: 0.5?)

 User
- 1:
  has_many :tasks
  has_many :comments, through :tasks
- 2:
  :scope :comments, -> {}
  :scope :comments_by_tasks, ->(*tasks) {}
  :scope :tasks, -> {}

Tasks.includes(:comments).each do |task|...

Tasks.includes([:comments, :reporter]).where('comments.count > 0')

Recent updates:
  - last_active timestamp set in User from HomeController?
  - each time HomeController#index
  	queries for new Tasks (order by updated at desc) and new Comments (group by Tasks, updated at desc)
  	since last_active for Recent Activity feed?

^^ Try with:
User
  has_many :most_recent_comments, -> { order('id desc').limit(10)** }, :class_name => 'Comment'

