json.array!(@destinations) do |destination|
  json.extract! destination, :id, :path
  json.url destination_url(destination, format: :json)
end
