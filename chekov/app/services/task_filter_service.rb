require 'singleton'

class TaskFilterService
  include Singleton

  # - returns `filtered_tasks` in HomeHelper?
  # - or `@filtered_tasks` in HomeController?
  # filters as symbols: Status.pluck(:name).map(&:downcase.to_sym) <-- actually use Filters Filters

  class << self

    def with_tasks(tasks)
      @tasks = tasks || Task.all.order(:updated_at => :desc)
      self
    end

    def for_user(user)
      @user = user || User.nobody
      self
    end

    def calculate_stats
      StatisticsService.calculate @tasks, @user
    end

    # def filtered_tasks(filter)
    #   case filter
    #   when 'all'
    #     Task.all.order(:updated_at => :desc)
    #   when *Status.all.map(&:shortname)
    #     Task.where(:status_id => Status.where(:shortname => filter)).order(:updated_at => :desc)
    #   when 'mine'
    #     Task.where(:assignee => current_user).order(:updated_at => :desc)
    #   end
    # end


  end
end