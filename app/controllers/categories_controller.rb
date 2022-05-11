class CategoriesController < ApplicationController
  before_action :set_distribution
  before_action :set_category, only: %i[ show edit update destroy ]

  def new
    @category = @distribution.categories.build
  end

  def edit
  end

  def create
    @category = @distribution.categories.build(category_params)

    if @category.save
      redirect_to @distribution
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @distribution
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    
    redirect_to @distribution
  end

  private

  def set_distribution
    @distribution = Distribution.find(params[:distribution_id])
  end

  def set_category
    @category = @distribution.categories.find(params[:id])
  end

  def category_params 
    params.require(:category).permit(:name, :description)
  end
end
