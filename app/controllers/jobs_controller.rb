class JobsController < ApplicationController
  def index
    @jobs = Job.alive.approved
  end

  def show
    @job = find_job
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  private

  def find_job
    begin
      Job.alive.approved.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to jobs_path
    end
  end

  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :company_name,
      :company_website,
      :how_to_apply
    )
  end
end
