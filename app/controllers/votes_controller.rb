class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def vote_by_user
  @ip_address = request.remote_ip
  @candidate = Candidate.find(params[:candidate_id])
  @candidate_id = @candidate.id
  @area_id = @candidate.area_id
  @party_id = @candidate.party_list_id

@check_vote =  Vote.where("ip_address='#{@ip_address}' and area_id = #{@area_id}")
@already_vote = 0

if @check_vote!=nil && @check_vote.size.to_i!=0
  @already_vote = 1
else
  @new_vote = Vote.new
  @new_vote.candidate_id = params[:candidate_id]
  @new_vote.party_list_id = @party_id
  @new_vote.area_id =  @area_id
  @new_vote.ip_address = @ip_address
  @new_vote.save

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

 @all_party.each do |p|
 if @lead_party_hash["#{p.id}"].to_i!=0

  p.leading_count = @lead_party_hash["#{p.id}"]
  p.save!
 end
end#@all_party.each do |p|


# add leading count

end

end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:candidate_id, :ip_address)
    end
end
