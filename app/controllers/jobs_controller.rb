class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @jobs = Job.search(params[:search])
    @tags = Tag.search(params[:search])
  end

  def show
    @job = Job.find(params[:id])
    @tag = Tag.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save
      flash[:notice] = "Job posted!"
    redirect_to job_path(@job)
  end

private

  def job_params
    params.require(:job).permit(:title, :skills, :description, :budget, :tag_list)
  end

end
