json.extract! post, :id, :title, :post_categorie_id, :content, :thumbnails, :user, :created_at, :updated_at
json.url post_url(post, format: :json)
