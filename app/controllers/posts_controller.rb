class PostsController < ApplicationController
	  before_action :set_post, only: [:show, :edit, :update, :destroy, :new]

	  def new
	  	@post = Post.new
	  end

  def create
    @post = Post.new
    
    unless params[:post][:body].empty?
      @post.body = params[:post][:body]
      @post.user_id = current_user.id
      # @post.comment_id = params[:post_id]
      @post.save
    end

    redirect_to topics_path
  end

  def edit 
  end 

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated!"
      redirect_to topics_path
    else 
      flash[:alert] = "Something went wrong with the update."
      render topics_path
    end
  end

  def destroy
    if current_user.id == @post.user.id
    @post.destroy
    flash[:notice] = "Post was deleted."
    redirect_to topics_path
    else
    flash[:notice] = "You are not the owner of this post"
    redirect_to topics_path
    end  
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
