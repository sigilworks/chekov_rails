
module RecentActivityService
  extend self

  MAX_TOP_COMMENTERS = AppConfig.activity_feed.top_commenters.max || 5
  MAX_TOP_REPORTERS = AppConfig.activity_feed.top_reporters.max || 5
  MAX_TOP_ACTIVITIES = AppConfig.activity_feed.top_activities.max || 7

  def for_user(user)
    last_visit = (user.last_visited_at || Time.now).midnight - 1.week

    recents = {}

    Task.where('updated_at >= ?', last_visit).each do |task|
      entry = TaskActivityEntry.new(task)
      recents[entry.timestamp] = entry
    end

    Comment.where('updated_at >= ?', last_visit).each do |comment|
      entry = CommentActivityEntry.new(comment)
      recents[entry.timestamp] = entry
    end

    # update internal flag in user record of last time they accessed the application
    # is used to determine update 'deltas' since data on client was last retrieved
    user.update_attribute(:last_visited_at, Time.now)

    recents.sort.reverse[0...MAX_TOP_ACTIVITIES]
  end

  def top_commenters
    top_actives(Comment, :commenter, MAX_TOP_COMMENTERS)
  end

  def top_reporters
    top_actives(Task, :reporter, MAX_TOP_REPORTERS)
  end

  private

  def top_actives(model, agent, limit)
    Proc.new {
        model
          .limit(limit)
          .group(agent.to_sym)
          .count
          .map { |user, count| { :name => UserPresenter.new(user), :count => count } }
          .sort_by { |entry| entry[:count] }
          .reverse
    }.call
  end

  class AbstractActivityEntry
    attr_accessor :type, :action, :agent, :timestamp

    def initialize(entry)
      @entry = entry
      @timestamp = @entry.updated_at.to_i
      @is_created = @entry.created_at == @entry.updated_at
    end

    def formatted_time
      @entry.updated_at.strftime("#{ AppConfig.datetime.med }")
    end

    def agent; raise NotImplementedError end
    def action; raise NotImplementedError end
  end

  class TaskActivityEntry < AbstractActivityEntry
    @type = "task"

    def agent
      UserPresenter.new(@entry.reporter)
    end

    def action
      @is_created ?
        "created task ##{ @entry.id }" :
        "updated task ##{ @entry.id }"
    end
  end

  class CommentActivityEntry < AbstractActivityEntry
    @type = "comment"

    def agent
      UserPresenter.new(@entry.commenter)
    end

    def action
      @is_created ?
        "commented on task ##{ @entry.task.id }" :
        "updated a comment on task ##{ @entry.task.id }"
    end
  end

end