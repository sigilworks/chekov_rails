require 'singleton'

class TaskPromotionStrategy
  include Singleton

  class << self

    NEW = Status.find_by(:shortname => :new).id    # :id => 3
    OPEN = Status.find_by(:shortname => :open).id  # :id => 2

    def assess(task)
      is_promotable?(task) && promote!(task)
    end

    private

    # when a Task, with status == NEW, either:
    #   1. receives its first comment, or
    #   2. has its assignee changed from Nobody => a real user
    # the Task's status is 'promoted' from NEW => OPEN
    def is_promotable?(task)
      task.comments.empty? && task.status_id == NEW
    end

    def promote!(task)
      if task.status_id == NEW
        task.status_id = OPEN
        task.save
      end
    end
  end

end