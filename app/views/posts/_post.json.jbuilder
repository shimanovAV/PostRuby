json.extract! post, :id, :title, :body
json.url posts_url(post, format: :json)