
module StatisticsService
  extend self

  # - maintains #task-stats
  # - updates on filter change
  # - stats totals should reflect number of filtered tasks shown
  # - responds to `ajax:success`?
  # - or responds to another fn's call to this class each time?

  def calculate(tasks)
    { :open => open(tasks),
      :need_attention => need_attention(tasks),
      :closed => closed(tasks) }
  end

  private

    def need_attention(tasks)
      tasks.where(:status_id => 4..6).count
    end

    def open(tasks)
      tasks.where(:status_id => 2..3).count
    end

    def closed(tasks)
      tasks.where(:status_id => 1).count
    end

end