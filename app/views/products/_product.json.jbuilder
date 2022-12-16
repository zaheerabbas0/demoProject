json.extract! product, :id, :p_name, :p_price, :p_details, :created_at, :updated_at
json.url product_url(product, format: :json)
