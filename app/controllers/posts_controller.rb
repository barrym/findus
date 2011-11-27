class PostsController < ApplicationController

  before_filter :load_category

  def index
    render :json => @category.posts.order('created_at')
  end


  def load_category
    @category = Category.find(params[:category_id])
  end

end
