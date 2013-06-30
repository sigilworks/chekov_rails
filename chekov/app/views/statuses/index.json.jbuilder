json.array!(@statuses) do |status|
  json.extract! status, :name, :description, :shortname
  json.url status_url(status, format: :json)
end
