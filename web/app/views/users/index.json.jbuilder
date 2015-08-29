json.array!(@users) do |user|
  json.extract! user, :id, :provider, :uid, :name, :image, :email, :password
  json.url user_url(user, format: :json)
end
