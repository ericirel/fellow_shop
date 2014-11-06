class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @tags = Tag.search(params[:search])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end
end
