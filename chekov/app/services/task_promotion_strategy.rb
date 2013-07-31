
module TaskPromotionStrategy
  extend self

  NEW = Status.find_by(:shortname => :new).id    # :id => 3
  OPEN = Status.find_by(:shortname => :open).id  # :id => 2

  def assess(task)

    binding.pry

    promote!(task) if is_promotable?(task)
  end

  private
  # when a Task, with status == NEW, either:
  #   1. receives its first comment, or
  #   2. has its assignee changed from Nobody => a real user
  # the Task's status is 'promoted' from NEW => OPEN
  def is_promotable?(task)
    # task.comments.size >= 1 && task.status_id == NEW
    task.comments.empty? && task.status_id == NEW
  end

  def promote!(task)
    # task.status_id = OPEN
    # task.save
    task.update_attribute(:status_id, OPEN)
    # task.update(:status_id => OPEN)
    # task.update_columns(:status_id => OPEN)
  end

end