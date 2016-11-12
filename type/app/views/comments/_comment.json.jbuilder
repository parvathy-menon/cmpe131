json.extract! comment, :id, :body, :likes, :email, :created_at, :updated_at
json.url comment_url(comment, format: :json)