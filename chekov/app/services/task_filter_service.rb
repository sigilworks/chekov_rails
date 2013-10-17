
module TaskFilterService
  extend self

  ALL_FILTER_NAMES = (Status.all.map(&:shortname) + Filter.custom_filters).map(&:downcase) << 'all'

  def with_tasks(tasks)
    TaskFilterParams.new(tasks)
  end

  class TaskFilterParams
    def initialize(tasks)
      @tasks = tasks
    end

    def with_filter(filter)
      @filter = ALL_FILTER_NAMES.include?(filter) ? Filter.new(filter) : Filter.new(:all)
      self
    end

    def for_user(user)
      @user = user || User.nobody
      self
    end

    def filtered_tasks
      case @filter.name
      when 'all'
        @tasks
      when *Status.all.map(&:shortname)
        @tasks.where status_id: Status.find_by(:shortname => @filter.name)
      when 'mine'
        @tasks.where assignee: @user
      when 'unassigned'
        @tasks.where assignee: User.nobody
      when 'active'
        @tasks.where status_id: Status.active
      end
    end
  end

end