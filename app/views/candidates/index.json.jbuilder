json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :area_id, :party_list_id, :name, :image
  json.url candidate_url(candidate, format: :json)
end
