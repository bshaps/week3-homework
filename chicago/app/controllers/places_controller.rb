class PlacesController < ActionController::Base

	def index
		@places = Place.all
	end
	
	def show
		@place = Place.find_by(:id => params["id"])
		if @place.nil?
		  redirect_to "/places", notice: "Place not found."
		end
	end
	
	def delete
		place = Place.find_by(:id => params["id"])
		place.delete
		redirect_to "/places", notice: "Place deleted."
	end

end
