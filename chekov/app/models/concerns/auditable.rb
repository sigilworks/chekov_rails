module Auditable
  extend ActiveSupport::Concern

  included do
    after_save    :queue_change_activity
    after_destroy :queue_destroy_activity
  end

  def queue_change_activity
    if self.created_at_was.nil?
      QueueService.send("#{ class_name(self) }_creation_event", self.id, class_name(self), self.attributes)
    elsif self.updated_at > self.updated_at_was
      QueueService.send("#{ class_name(self) }_updation_event", self.id, class_name(self), self.attributes)
    end
  end

  def queue_destroy_activity
    QueueService.send("#{ class_name(self) }_deletion_event", self.id, class_name(self), self.attributes)
  end

  private

  def class_name(obj)
    obj.class.name
  end

end