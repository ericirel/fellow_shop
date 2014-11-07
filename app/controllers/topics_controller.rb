class TopicsController < ApplicationController

	  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topic = Topic.all
  end

  def show
    @topic = Topic.find_by_body(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    unless topic_params[:body].empty?
      @topic.save
      flash[:notice] = "New topic created!"
    else
      flash[:notice] = "Sorry - a topic was not made!"
    end

    redirect_to topics_path
  end

  def edit

  end

  def html5
    
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Topic updated!"
      redirect_to :back
    else
      flash[:alert] = "Something went wrong with the update."
    end
  end

  def destroy
      if current_user.id == @topic.user.id
      @topic.destroy
      flash[:notice] = "Topic was deleted."
      # redirect_to root_path
    else
      flash[:notice] = "you are not the owner of this topic"
      # redirect_to root_path
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:body).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
