json.array!(@applications) do |application|
  json.extract! application, :name
  json.url application_url(application, format: :json)
end
