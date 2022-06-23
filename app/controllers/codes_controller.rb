class CodesController < ApplicationController
  before_action :set_distribution
  before_action :set_code, only: %i[ show edit update destroy ]

  def new
    @code = @distribution.codes.build
  end

  def edit
  end

  def create
    @code = @distribution.codes.build(code_params)

    if @code.save
      redirect_to @distribution
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @code.update(code_params)
      redirect_to @distribution
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @code.destroy

    redirect_to @distribution
  end

  private

  def set_distribution
    @distribution = Distribution.find(params[:distribution_id])
  end

  def set_code
    @code = @distribution.codes.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:name, :description)
  end
end
