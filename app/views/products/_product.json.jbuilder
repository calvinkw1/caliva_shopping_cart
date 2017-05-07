json.extract! product, :id, :title, :description, :link, :created_at, :updated_at
json.url product_url(product, format: :json)
