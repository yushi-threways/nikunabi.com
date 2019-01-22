json.extract! shop_event, :id, :title, :content, :images, :closed_at, :published, :created_at, :updated_at
json.url shop_event_url(shop_event, format: :json)
