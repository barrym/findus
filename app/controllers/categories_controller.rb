class CategoriesController < ApplicationController

  before_filter :authenticate_user!

  def index
    render :json => Category.order(:name)
  end

  def show
    category = Category.find(params[:id])
    render :json => category
  end

end
