class DistributionsController < ApplicationController
  before_action :set_distribution, only: %i[ show edit update destroy ]

  def index
    @q = Distribution.ransack(params[:q])
    @distributions = @q.result
  end

  def show
  end

  def new
    @distribution = Distribution.new
  end

  def edit
  end

  def create
    @distribution = Distribution.new(distribution_params)

    if @distribution.save
      redirect_to @distribution, notice: "Distribution was successfully created."
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @distribution.update(distribution_params)
      redirect_to @distribution, notice: "Distribution was successfully updated."
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @distribution.destroy

    redirect_to root_url, notice: "Distribution was successfully destroyed."
  end

  private

  def set_distribution
    @distribution = Distribution.find(params[:id])
  end

  def distribution_params
    params.require(:distribution).permit(:name)
  end
end
