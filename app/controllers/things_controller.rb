class ThingsController < ApplicationController

	def index
		@things = Thing.all
		render json: @things
	end

	def show
  		@thing = Thing.find(params[:id]) || []
  		render json: @thing
	end

	def new
		@thing = Thing.new
	end

	def edit
		@thing = Thing.find(params[:id])
	end

	def create
		@thing = Thing.new(thing_params)
		@thing.save
	end

	def update 
		@thing = Thing.find(params[:id])
	end
 
 	def destroy
 		@thing = Thing.find(params[:id])
 		@thing.destroy
 	end

	private
		def thing_params
	    	params.require(:thing).permit(:name)
	  	end

end