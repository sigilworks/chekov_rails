require 'taskrow'

class CommentView

    def initialize(comment)
        commenter = User.find(comment.commenter_id)
        task = Task.find(comment.task)
        assignee = User.find(task.assignee_id)

        @statusClass = task.status.classname.downcase
        @task = TaskRow.new(task)
        @commenter = commenter
        @datetime = comment.created_at
        @description = comment.description
        @assignee = assignee
    end

end


class TaskRow

    def initialize(task)
        @id = task.id
        @app = task.application_id
        @build = task.build_observed ||= ''
        @description = task.description ||= ''
        @browser = task.browser_id
        @bzId = task.bz_id ||= ''
        @reporter = task.reporter_id
        @comments_count = task.comments.count
        @status = task.status_id
    end

end