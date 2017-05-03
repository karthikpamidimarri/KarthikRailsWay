json.extract! event, :id, :artist, :description, :price_low, :price_high, :event_date, :created_at, :updated_at
json.url event_url(event, format: :json)
