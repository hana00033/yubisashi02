class SpacesController < ApplicationController
	before_action :authenticate_user!
	def new
	  @space = Space.new
	  @spaces = current_user.spaces
	end

	def create
  	  @space = current_user.spaces.new space_params
  	  @space.save!
  	  redirect_to new_space_path
	end

	private
	def space_params
      params.require(:space).permit(:name, :room, :r_at)
    end
end
