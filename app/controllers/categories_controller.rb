class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def show
    @category = current_user.categories.find(params[:id])
    @transacs = @category.transancts
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save

      redirect_to user_categories_path
    else
      flash[:alert] = 'All fields are required'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
