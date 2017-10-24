json.extract! forum_thread, :id, :user_id, :subject, :created_at, :updated_at
json.url forum_thread_url(forum_thread, format: :json)
