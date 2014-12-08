class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    redirect_to '/admin'
  end

  def show
    return redirect_to '/' unless user_signed_in?

    @listings = @category.listings.order(:title)
    respond_with(@category)
  end

  def new
    return redirect_to '/' unless user_signed_in?

    @category = Category.new
    respond_with(@category)
  end

  def edit
    return redirect_to '/' unless user_signed_in?
  end

  def create
    return redirect_to '/' unless user_signed_in?

    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    return redirect_to '/' unless user_signed_in?

    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    return redirect_to '/' unless user_signed_in?
    
    @category.destroy
    redirect_to '/admin'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
