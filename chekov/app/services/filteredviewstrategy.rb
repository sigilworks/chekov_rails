require 'singleton'

class FilteredViewStrategy
  include Singleton

  class << self

    def for(user)

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