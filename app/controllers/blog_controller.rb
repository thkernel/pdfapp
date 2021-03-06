class BlogController < ApplicationController
  layout "front"
  
  def index
    product = PostCategory.find_by(name: "Nos produits")
    about = PostCategory.find_by(name: "A propos de nous")

    exclude_categories = [product.id, about.id]
    
    @posts = Post.where("post_category_id NOT IN (?)", exclude_categories ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
  end
  end

  def show
    #@post = Post.find(params[:id])
    @post = Post.friendly.find(params[:slug])
end
