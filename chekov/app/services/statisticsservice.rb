require 'singleton'

class StatisticsService
  include Singleton

  # - maintains #task-stats
  # - updates on filter change
  # - stats totals should reflect number of filtered tasks shown
  # - responds to `ajax:success`?
  # - or responds to another fn's call to this class each time?

  class << self

    # :open => Task.all.where(:status_id => 2).count
    # :need_attention => Task.all.where(:status_id => 4..6).count
    # :closed => Task.all.where(:status_id => 1).count
    
    def calculate(tasks, user)

    end

  end
end