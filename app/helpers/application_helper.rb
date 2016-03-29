module ApplicationHelper
def get_decs_cat_value(cat_id,candidate)
	if cat_id.to_i==1
	@desc_cat = candidate.x1
	elsif cat_id.to_i==2
	@desc_cat = candidate.x2
	elsif cat_id.to_i==3
	@desc_cat = candidate.x3
	elsif cat_id.to_i==4
	@desc_cat = candidate.x4
	elsif cat_id.to_i==5
	@desc_cat = candidate.x5
	elsif cat_id.to_i==6
	@desc_cat = candidate.x6
	elsif cat_id.to_i==7
	@desc_cat = candidate.x7
	elsif cat_id.to_i==8
	@desc_cat = candidate.x8
	elsif cat_id.to_i==9
	@desc_cat = candidate.x9
	elsif cat_id.to_i==10
	@desc_cat = candidate.x10
	elsif cat_id.to_i==11
	@desc_cat = candidate.x11
	elsif cat_id.to_i==12
	@desc_cat = candidate.x12
	elsif cat_id.to_i==13
	@desc_cat = candidate.x13
	elsif cat_id.to_i==14
	@desc_cat = candidate.x14
	elsif cat_id.to_i==15
	@desc_cat = candidate.x15
	end
end#def get_decs_cat_value(cat_id,candidate)

def get_vote_count(candidate_id)
	@vote_count=0
@all_vote = Vote.where("candidate_id=#{candidate_id}")
if @all_vote!=nil && @all_vote.size.to_i!=0	
	@vote_count=@all_vote.size
end
end#def get_vote_count(candidate_id)
	
def get_vote_count_party(party_id)
	@vote_count=0
@all_vote = Vote.where("party_list_id=#{party_id}")
if @all_vote!=nil && @all_vote.size.to_i!=0	
	@vote_count=@all_vote.size
end
end#def get_vote_count(candidate_id)

def get_leading
	# add leading count 
	@all_party = PartyList.all
	@all_area = Area.all
	@lead_party_hash = Hash.new
	@all_area.each do |a|
	@party_hash = Hash.new
	  @all_party.each do |p|
	  @vote_lead =  Vote.where("area_id = #{a.id} and party_list_id=#{p.id}")
	  @party_hash["#{a.id}_#{p.id}"] = @vote_lead.size
	  end#@all_party.each do |p|

	@lead_party = @party_hash.values.max
	@party_id = @party_hash.key(@lead_party)

	if @lead_party!=nil and @lead_party.to_s!="" and @lead_party.to_i!=0 and @party_id!=""
	#puts"=@lead_party=====#{@party_hash}=#{@lead_party}=-#{@lead_party.class}---#{@party_id}="
	@find_party = @party_id.split("_")[1]
	if @lead_party_hash["#{@find_party}"]!="" 
	@lead_party_hash["#{@find_party}"] = @lead_party_hash["#{@find_party}"].to_i+1
	else
	@lead_party_hash["#{@find_party}"] = 1
	end
	end
	end#@all_area.each do |a|

	#puts"=@lead_party==11111===#{@lead_party_hash}==="
end#def get_leading


end
