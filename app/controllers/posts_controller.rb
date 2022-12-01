class PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  before_action :only_user, only: [:edit, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def post_find
    @post = Post.find(params[:id])
  end

  def only_user
    redirect_to posts_path unless current_user.id == @post.user_id
  end

end
