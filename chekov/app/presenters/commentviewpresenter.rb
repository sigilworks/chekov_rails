# /*
#  * This entity is a View DTO that takes a
#  * Comment model and formats its data,
#  * formatted for direct inclusion in the page.
#  */
# class CommentView {

# 	public $statusClass;
# 	public $task;
# 	public $commenter;
# 	public $datetime;
# 	public $description;
# 	public $assignee;

#     public function __construct($comment) {

# 		  $commenter = User::find($comment->commenter);
#   		$task = TaskItem::find($comment->taskid);
#   		$assignee = User::find($task->assignee);

#   		$this->statusClass = strtolower(Status::find($task->status)->classname);
#   		$this->task = $task->attributes;
#   		$this->commenter = $commenter->attributes;
#   		$this->datetime = $comment->datetime;
#   		$this->description = $comment->description;
#   		$this->assignee = $assignee->attributes;
#     }

# }