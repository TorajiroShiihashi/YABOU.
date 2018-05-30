json.extract! micropost, :id, :title_what, :title_when, :content, :user_id, :created_at, :updated_at
json.url micropost_url(micropost, format: :json)
