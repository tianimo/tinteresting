json.array!(@tins) do |tin|
  json.extract! tin, :id, :description
  json.url tin_url(tin, format: :json)
end
