class CategoriesController < ApplicationController
  def index 
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create  
    @category = Category.new(category_params)
 
    if @category.save
      redirect_to @category
      flash[:notice] = 'Your prescription was successfully created'
    else
      render :new, alert: 'An error has occurred while creating a prescription'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
