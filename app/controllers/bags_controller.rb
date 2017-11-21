class BagsController < ApplicationController

	def index
		@bags = Bag.all
		render json: @bags 
	end

	def show
  		@bag = Bag.find(params[:id]) || []
  		render json: @bag
	end

	def new
		@bag = Bag.new
		render json: @bag
	end

	def edit
		@bag = Bag.find(params[:id])
	end

	def create
		@bag = Bag.new(bag_params)
		@bag.save
	end

	def update 
		@bag = Bag.find(params[:id])
		@bag.save
	end
 
 	def destroy
 		@bag = Bag.find(params[:id])
 		@bag.destroy
 	end

	private
		def bag_params
	    	params.require(:bag).permit(:name, :description)
	  	end

end