
atom_feed :language => 'en-US' do |feed|
  feed.title "All Tasks"
  feed.updated Time.now

  @tasks.each do |item|
    next if item.updated_at.blank?
    task = TaskRowPresenter.new(item)
    content = <<-DONE

          Task: #{ task.id }

        Status: #{ task.status_name.upcase }
      Reporter: #{ task.reporter.index_name }
      Assignee: #{ task.assignee.index_name }
      --------------------------------------------------
         Application: #{ task.application.name }
      Build Observed: #{ task.build_observed }
               BZ id: #{ task.bz_id || 'n/a' }
             Browser: #{ task.browser.shortname }
      --------------------------------------------------
      Description:   (#{ task.comments_count } comments)

        #{ task.description }

    DONE

    feed.entry(item) do |entry|
      entry.url task_url(item)
      entry.title "Task #{ item.id }"
      entry.summary task.abstract
      entry.content content, :type => 'html'
      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author task.reporter.index_name
    end
  end
end