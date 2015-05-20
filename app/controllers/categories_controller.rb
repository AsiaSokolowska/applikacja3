class CategoriesController < ApplicationController

  #after_action :log_event, only:[:create, :update]
  after_action  -> { log_event(@category)} only: [:create]#lambda
  skip_around_action :play_with_logger

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to log_events_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end


end
