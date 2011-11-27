class SiteController < ApplicationController

  def index
    @categories = Category.order(:name).all
  end

end
