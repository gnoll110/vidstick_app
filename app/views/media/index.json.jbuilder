json.array!(@media) do |medium|
  json.extract! medium, :id, :filename, :modified_filename
  json.url medium_url(medium, format: :json)
end
