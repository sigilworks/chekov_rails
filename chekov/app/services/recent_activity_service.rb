
module RecentActivityService
  extend self

  def for_user(user)
    last_visit = 3.days.ago # user.last_visited_at
    return [] if last_visit.nil?

    @recents = {}

    Task.where('updated_at >= ?', last_visit).each do |task|
      entry = TaskActivityEntry.new(task)
      @recents[entry.timestamp] = entry
    end

    Comment.where('updated_at >= ?', last_visit).each do |comment|
      entry = CommentActivityEntry.new(comment)
      @recents[entry.timestamp] = entry
    end

    Hash[ @recents.sort ]
  end


  def top_commenters
    Comment.limit(5).count(:group => :commenter).map do |user, count|
      { :name => UserPresenter.new(user).index_name, :count  => count }
    end
  end

  def top_reporters
    Task.limit(5).count(:group => :reporter).map do |user, count|
      { :name => UserPresenter.new(user).index_name, :count  => count }
    end
  end


  private

  class AbstractActivityEntry
    attr_accessor :type, :action, :agent, :timestamp

    def initialize(entry)
      @entry = entry
      @timestamp = @entry.updated_at.to_i
      @is_created = @entry.created_at == @entry.updated_at
    end

    def formatted_time
      @entry.updated_at.strftime('%b %d, %Y %l:%M %p')
    end
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