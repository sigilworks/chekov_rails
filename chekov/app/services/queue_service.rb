
module QueueService
  extend self

  # TODO: replace these methods using `method_missing`
  def created_task(id, attrs = {})
    emit('task:created', "Task #{ id } created")
  end

  def updated_task(id, attrs = {})
    emit('task:updated', "Task #{ id } updated")
  end

  def deleted_task(id, attrs = {})
    emit('task:deleted', "Task #{ id } deleted")
  end

  def created_comment(id, attrs = {})
    emit('comment:created', "Comment #{ id } created")
  end

  def updated_comment(id, attrs = {})
    emit('comment:updated', "Comment #{ id } updated")
  end

  def deleted_comment(id, attrs = {})
    emit('comment:deleted', "Comment #{ id } deleted")
  end


  private 

  # eventually, optional use of new object's attributes in `data`
  def emit(msg, data = {})
    $redis.set(msg, data)
  end

end