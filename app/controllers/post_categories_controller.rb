class PostCategoriesController < ApplicationController

  before_action :authenticate_user!
  layout 'dashboard'
  

  before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  # GET /post_categories
  # GET /post_categories.json
  def index
    @post_categories = PostCategory.all
  end

  # GET /post_categories/1
  # GET /post_categories/1.json
  def show
  end

  # GET /post_categories/new
  def new
    @post_category = PostCategory.new
  end

  # GET /post_categories/1/edit
  def edit
  end

  # POST /post_categories
  # POST /post_categories.json
  def create
    @post_category = current_user.post_categories.build(post_category_params)

    respond_to do |format|
      if @post_category.save
        @post_categories = PostCategory.all

        format.html { redirect_to @post_category, notice: 'Post category was successfully created.' }
        format.json { render :show, status: :created, location: @post_category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /post_categories/1
  # PATCH/PUT /post_categories/1.json
  def update
    respond_to do |format|
      if @post_category.update(post_category_params)
        @post_categories = PostCategory.all

        format.html { redirect_to @post_category, notice: 'Post category was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_category }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @post_category = PostCategory.find(params[:post_category_id])
  end


  # DELETE /post_categories/1
  # DELETE /post_categories/1.json
  def destroy
    @post_category.destroy
    @post_categories = PostCategory.all

    respond_to do |format|
      format.html { redirect_to post_categories_url, notice: 'Post category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_category_params
      params.require(:post_category).permit(:name, :description)
    end
end
