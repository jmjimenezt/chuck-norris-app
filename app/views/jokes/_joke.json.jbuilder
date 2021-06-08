json.extract! joke, :id, :url, :icon_url, :value, :categories, :created_at, :updated_at
json.url joke_url(joke, format: :json)
