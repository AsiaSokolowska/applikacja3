class WelcomeController < ApplicationController

  def index
  end

  def search
    @search_term = params[:q]
  end

end
