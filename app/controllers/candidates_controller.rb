class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
before_action :check_admin, only: [:index, :create, :update, :destroy, :edit]
  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all.order(:id)
    #render json: @candidates
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    index
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def select_dist
  @dist = DistrictList.all
  if params[:dist_id]
    @area = DistrictList.find(params[:dist_id]).areas
    render :layout=>false
  end
end

def party_candidate
 
  if params[:party_id]
   @candidates = Candidate.where("party_list_id=#{params[:party_id]}").order(:id)
    render :layout=>false
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:area_id, :party_list_id, :name, :image, :district_list_id, :desc, :avatar, :x1, :x2, :x3, :x4, :x5, :x6, :x7, :x8, :x9, :x10, :x11, :x12, :x13, :x14, :x15,:cm_candidate)
    end
end
