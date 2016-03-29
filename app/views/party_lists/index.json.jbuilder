json.array!(@party_lists) do |party_list|
  json.extract! party_list, :id, :name, :image, :comments
  json.url party_list_url(party_list, format: :json)
end
