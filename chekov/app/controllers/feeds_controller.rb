class FeedsController < ApplicationController

  # TODO: technically this just returns /tasks...
  # Comments need to be appended, too, for this to be truly 'all'
  def all
    respond_to do |format|
      @tasks = TaskFilterService
        .with_tasks(Task.all.order(:updated_at => :desc))
        .for_user(current_user)
        .with_filter(Filter.ALL)
        .filtered_tasks
        .joins(:comments)
        .group(:id)
      format.atom
      format.rss
    end
  end

  def tasks
    respond_to do |format|
      @tasks = TaskFilterService
        .with_tasks(Task.all.order(:updated_at => :desc))
        .for_user(current_user)
        .with_filter(Filter.ALL)
        .filtered_tasks
      format.atom
      format.rss
    end
  end

  # TODO: implement me!
  def comments
    respond_to do |format|
      format.atom
      format.rss
    end
  end

  # TODO: implement me!
  def mine
    respond_to do |format|
      format.atom
      format.rss
    end
  end

  # TODO: implement me!
  def unassigned
    respond_to do |format|
      format.atom
      format.rss
    end
  end

end
