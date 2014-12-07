class BaseController < ApplicationController
	def home
		@listings = Listing.all
	end

	def admin
		@categories = Category.all
	end
end
