class PlacesController < ActionController::Base

	def index
		@places = Place.all
	end
	
	def show		
		@place = Place.find_by(:id => params["id"])
		@reviews = Review.all.where(:place => params["id"]).order("id DESC")
		if @place.nil?
			redirect_to "/places", notice: "Place not found."
		end
	end
	
	def delete
		place = Place.find_by(:id => params["id"])
		place.delete
		redirect_to "/places", notice: "Place deleted."
	end
	
	def new	
	end
	
	def create
		place = Place.new
		place.title = params[:title]
		place.photo_url = params[:url]
		place.admission_price = params[:admission]
		place.description = params[:description]
		place.save
		redirect_to "/places", notice: "Place created."
	end
	
	def edit
		@place = Place.find_by(:id => params["id"])
		if @place.nil?
			redirect_to "/places", notice: "Place not found."
		end
	end
	
	def update
		@place = Place.find_by(:id => params["id"])
		if @place.nil?
			redirect_to "/places", notice: "Place not found."
		else
			@place.description = params["description"]
			@place.save
			redirect_to "/places/#{@place.id}", notice: "Place updated."
		end		
	end
	
	def review
		review = Review.new
		review.place = params[:id]
		review.title = params[:title]
		review.rating = params[:rating]
		review.review = params[:review]
		review.save
		redirect_to "/places/#{params[:id]}", notice: "Review added."
	end

end
