class HomeController < ApplicationController
  def index
  	#@party = PartyList.all
    if params[:dist_id] && params[:area_id]
    	@query = "area_id=#{params[:area_id]} and district_list_id =#{params[:dist_id]}"
   
    else
    	@query ="cm_candidate=1"
    
    end
   @candidate = Candidate.where("#{@query}")

  end
end
