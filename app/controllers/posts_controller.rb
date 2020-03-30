class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  layout 'dashboard'

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if @post.file.attached?
      puts "URL EST: #{url_for(@post.file)}"
      @file_url = url_for(@post.file)
    end
    render layout: "front"

  end

  # GET /posts/new
  def new
    @post_categories = PostCategory.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post_categories = PostCategory.all

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @post.post_type_id = PostType.find_by(name: "PDF").id

    #@post.excerpt = @post.content.truncate_words(100, omission: '...').html_safe
    respond_to do |format|
      if @post.save
        @posts = Post.all

        format.html { redirect_to  edit_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.excerpt = @post.content.truncate_words(100, omission: '...').html_safe

    respond_to do |format|
      if @post.update(post_params)
        @posts = Post.all

        format.html { redirect_to edit_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    if params[:post_id].present?
      @post = Post.friendly.find(params[:post_id])
    else
      @post = Post.friendly.find(params[:slug])

    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    @posts = Post.all

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if params[:id].present?
        
        @post = Post.friendly.find(params[:id])
      else
        @post = Post.friendly.find(params[:slug])

      end


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :post_category_id, :content, :thumbnail, :file)
    end
end
