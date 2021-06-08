json.extract! search_result, :id, :keywords, :categories, :random, :email, :created_at, :updated_at
json.url search_result_url(search_result, format: :json)
