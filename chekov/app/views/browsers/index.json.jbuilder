json.array!(@browsers) do |browser|
  json.extract! browser, :name, :shortname
  json.url browser_url(browser, format: :json)
end
