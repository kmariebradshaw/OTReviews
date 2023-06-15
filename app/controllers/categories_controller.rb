class CategoriesController < ApplicationController
  def new 
    @category = Category.new
    @categories = Category.all 
  end 
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to '/categories'
    else
      render 'new'
    end 
  end 
  def show
    @category = Category.find(params[:id]) 
  end 
  def index
    @categories = Category.all 
  end 
  def edit
    @category = Category.find(params[:id])
        @categories = Category.all 

  end 
  def update
    @category = Category.find(params[:id]) 
     if @category.update(category_params)
      redirect_to '/categories'
     else
      render 'edit'
    end
  end 
  def destroy
    @category = Category.find(params[:id])
    @category.destroy 
    redirect_to '/categories'
  end
  private 
  def category_params
      params.require(:category).permit(:name, :status)
  end 
end
