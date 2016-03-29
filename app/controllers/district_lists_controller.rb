class DistrictListsController < ApplicationController
  before_action :set_district_list, only: [:show, :edit, :update, :destroy]

  # GET /district_lists
  # GET /district_lists.json
  def index
    @district_lists = DistrictList.all
  end

  # GET /district_lists/1
  # GET /district_lists/1.json
  def show
  end

  # GET /district_lists/new
  def new
    @district_list = DistrictList.new
  end

  # GET /district_lists/1/edit
  def edit
  end

  # POST /district_lists
  # POST /district_lists.json
  def create
    @district_list = DistrictList.new(district_list_params)

    respond_to do |format|
      if @district_list.save
        format.html { redirect_to @district_list, notice: 'District list was successfully created.' }
        format.json { render :show, status: :created, location: @district_list }
      else
        format.html { render :new }
        format.json { render json: @district_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /district_lists/1
  # PATCH/PUT /district_lists/1.json
  def update
    respond_to do |format|
      if @district_list.update(district_list_params)
        format.html { redirect_to @district_list, notice: 'District list was successfully updated.' }
        format.json { render :show, status: :ok, location: @district_list }
      else
        format.html { render :edit }
        format.json { render json: @district_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /district_lists/1
  # DELETE /district_lists/1.json
  def destroy
    @district_list.destroy
    respond_to do |format|
      format.html { redirect_to district_lists_url, notice: 'District list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district_list
      @district_list = DistrictList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_list_params
      params.require(:district_list).permit(:name)
    end
end
