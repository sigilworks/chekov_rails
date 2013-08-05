
module QueueService
  extend self

  # TODO: replace these methods using `method_missing`
  def creation_event(id, class_name, attrs = {})
    emit('#{ class_name.downcase }:creation', "#{ class_name } ##{ id } created")
  end

  def updation_event(id, class_name, attrs = {})
    emit('#{ class_name.downcase }:updation', "#{ class_name } #{ id } updated")
  end

  def deletion_event(id, class_name, attrs = {})
    emit('#{ class_name.downcase }:deletion', "#{ class_name } #{ id } deleted")
  end

  private

  # eventually, optional use of new object's attributes in `data`
  def emit(msg, data = {})
    $redis.set(msg, data)
  end

end