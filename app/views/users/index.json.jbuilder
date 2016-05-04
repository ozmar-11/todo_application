json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :user_name
  json.url user_url(user, format: :json)
end
