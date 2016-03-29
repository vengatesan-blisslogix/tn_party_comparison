class PartyListsController < ApplicationController
  before_action :set_party_list, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:index, :create, :update, :destroy, :edit]
  # GET /party_lists
  # GET /party_lists.json
  def index
    @party_lists = PartyList.all.order(:id)
  end

  # GET /party_lists/1
  # GET /party_lists/1.json
  def show
  end

  # GET /party_lists/new
  def new
    @party_list = PartyList.new
  end

  # GET /party_lists/1/edit
  def edit
  end

  # POST /party_lists
  # POST /party_lists.json
  def create
    @party_list = PartyList.new(party_list_params)

    respond_to do |format|
      if @party_list.save
        format.html { redirect_to @party_list, notice: 'Party list was successfully created.' }
        format.json { render :show, status: :created, location: @party_list }
      else
        format.html { render :new }
        format.json { render json: @party_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /party_lists/1
  # PATCH/PUT /party_lists/1.json
  def update
    respond_to do |format|
      if @party_list.update(party_list_params)
        format.html { redirect_to @party_list, notice: 'Party list was successfully updated.' }
        format.json { render :show, status: :ok, location: @party_list }
      else
        format.html { render :edit }
        format.json { render json: @party_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /party_lists/1
  # DELETE /party_lists/1.json
  def destroy
    @party_list.destroy
    respond_to do |format|
      format.html { redirect_to party_lists_url, notice: 'Party list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_list
      @party_list = PartyList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_list_params
      params.require(:party_list).permit(:name, :avatar, :comments)
    end
end
