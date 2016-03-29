json.array!(@district_lists) do |district_list|
  json.extract! district_list, :id, :name
  json.url district_list_url(district_list, format: :json)
end
