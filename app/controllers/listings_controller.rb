class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    return redirect_to '/' unless user_signed_in?

    @listings = Listing.order(:title).all
    respond_with(@listings)
  end

  def show
    respond_with(@listing)
  end

  def new
    return redirect_to '/' unless user_signed_in?

    @listing = Listing.new
    @categories = Category.order(:name).all
    respond_with(@listing)
  end

  def edit
    return redirect_to '/' unless user_signed_in?

    @categories = Category.order(:name).all
  end

  def create
    return redirect_to '/' unless user_signed_in?

    @listing = Listing.new(listing_params)
    @listing.save
    respond_with(@listing)
  end

  def update
    return redirect_to '/' unless user_signed_in?

    @listing.update(listing_params)
    respond_with(@listing)
  end

  def destroy
    return redirect_to '/' unless user_signed_in?
    
    cat = @listing.category
    @listing.destroy
    
    redirect_to (cat.blank?) ? '/admin' : category_path(cat)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :description, :price, :status, :image, :category, :category_id)
    end
end
