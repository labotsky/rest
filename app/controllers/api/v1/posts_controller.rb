module Api
  module V1
class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :json
  # GET /posts
  # GET /posts.json
  def index
    respond_with Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_with Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    respond_with Post.create(post_params)
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_with Post.update(params[:id],post_params)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end

end
end
