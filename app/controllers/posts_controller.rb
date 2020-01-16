class PostsController < ApplicationController
  before_action :find_post, only: %i[show]

  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    @post.save

    redirect_to @post
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
