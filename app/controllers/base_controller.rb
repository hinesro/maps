class BaseController < ApplicationController
	def home
		@listings = Listing.order(:title).all
	end

	def admin
		return redirect_to '/' unless user_signed_in?
		
		@categories = Category.order(:name).all
	end
end
