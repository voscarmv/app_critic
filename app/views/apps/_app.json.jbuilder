json.extract! app, :id, :name, :url, :description, :created_at, :updated_at
json.url app_url(app, format: :json)
