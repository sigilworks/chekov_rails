
module TaskPromotionStrategy
  extend self

  def assess(task)
    promote!(task) if is_promotable?(task)
  end

  private
  # when a Task, with status == NEW, either:
  #   1. receives its first comment, or
  #   2. has its assignee changed from Nobody => a real user
  # the Task's status is 'promoted' from NEW => OPEN
  def is_promotable?(task)
    # perhaps here because of new first comment:
    if task.after_add_for_comments?
      task.status_id == Status.NEW # Status.where(:name => 'NEW').pluck(:id) # Status.NEW
    # otherwise, perhaps here because of assignee change from Nobody to a real user:
    elsif task.assignee_id_changed?
      task.assignee_id_change.first == User.nobody.id
    end
  end

  def promote!(task)
    task.update_attribute(:status_id, Status.OPEN) # Status.where(:name => 'OPEN').pluck(:id))
  end

end