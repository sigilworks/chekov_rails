json.array!(@tasks) do |task|
  json.extract! task, :application_id, :build_observed, :description, :bz_id, :reporter_id, :assignee_id, :status_id, :browser_id
  json.url task_url(task, format: :json)
end
