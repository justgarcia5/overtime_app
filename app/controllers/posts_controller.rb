class PostsController < ApplicationController
  before_action :set_post, only: %i[show update edit destroy]

  def index
    if current_user.try(:type) == 'AdminUser'
      @posts = Post.all
    else
      @posts = current_user.posts
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to post_path, notice: 'Your post was updated successfully'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    return unless @post.destroy

    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
