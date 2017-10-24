json.extract! post, :id, :thread_id, :user_id, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
