class CategoriesController < ApplicationController

  def index
    render :json => Category.order(:name)
  end

  def show
    category = Category.find(params[:id])
    render :json => category
  end

end
