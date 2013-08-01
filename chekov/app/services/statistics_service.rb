
module StatisticsService
  extend self

  def calculate(tasks)
    { :open => open(tasks),
      :need_attention => need_attention(tasks),
      :closed => closed(tasks) }
  end

  private

    def need_attention(tasks)
      tasks.where(:status_id => Status.need_attention).count
    end

    def open(tasks)
      tasks.where(:status_id => Status.open).count
    end

    def closed(tasks)
      tasks.where(:status_id => Status.closed).count
    end

end