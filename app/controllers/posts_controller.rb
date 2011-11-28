class PostsController < ApplicationController

  before_filter :load_category
  before_filter :authenticate_user!

  def index
    render :json => @category.posts.order('created_at')
  end

  def create
    post = @category.posts.new(params[:post])
    post.user = current_user
    post.save!
    render :json => post
  end


  def load_category
    @category = Category.find(params[:category_id])
  end

end
