class PostsController < ApplicationController
	  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new(params[:post])
  end

  def create
    @post = Post.new(post_params)

    unless post_params[:body].empty?
      @post.save
      flash[:notice] = "New post created!"
      redirect_to :back
    else
      flash[:notice] = "Sorry - a post was not made!"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated!"
      redirect_to @post
    else
      flash[:alert] = "Something went wrong with the update."
      render :edit
    end
  end

  def destroy
      if current_user.id == @post.user.id
      @post.destroy
      flash[:notice] = "Post was deleted."
      redirect_to :back
    else
      flash[:notice] = "you are not the owner of this post"
      redirect_to :back
    end
  end

  def html5
    @posts = Post.all
  end

  def css3

  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
