json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :username, :role_id, :team_id, :permission_id
  json.url user_url(user, format: :json)
end
