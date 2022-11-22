json.extract! user, :id, :name, :photo, :bio, :updatedat, :createdat, :postscounter, :created_at, :updated_at
json.url user_url(user, format: :json)
