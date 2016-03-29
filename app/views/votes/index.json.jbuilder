json.array!(@votes) do |vote|
  json.extract! vote, :id, :candidate_id, :ip_address
  json.url vote_url(vote, format: :json)
end
