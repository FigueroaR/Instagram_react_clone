class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts.order(created_at: :desc)

    # if current_user 
    #   render json: current_user.posts.order(created_at: :desc)
    # end
  end

  # GET /posts/1
  def show
    # binding.pry
    render json: @post
  end

  # POST /posts
  def create
    # binding.pry
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    binding.pry
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    # binding.pry
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.permit(:content, :location, :user_id, :image)
    end
end
