
# /*
#  * This entity is a View DTO that takes a
#  * Task model and converts it to a table row,
#  * formatted for direct inclusion in the page.
#  */
# class TaskRow {

# 	public $id;
# 	public $app;
# 	public $build;
# 	public $description;
# 	public $browser;
# 	public $bzId;
# 	public $reporter;
# 	public $comments_count;
# 	public $status;

#     public function __construct($task) {
# 		$this->id = (int) $task->task_id;
# 		$this->app = (int) $task->application;
# 		$this->build = empty($task->build_observed) ? '' : $task->build_observed;
# 		$this->description = empty($task->description) ? '' : $task->description;
# 		$this->browser = (int) $task->browser;
# 		$this->bzId = empty($task->bugzilla_ref_id) ? '' : $task->bugzilla_ref_id;
# 		$this->reporter = (int) $task->reporter;
# 		$this->comments_count = (int) Comment::where_taskid($task->task_id)->count();
# 		$this->status = (int) $task->status;
#     }
# }