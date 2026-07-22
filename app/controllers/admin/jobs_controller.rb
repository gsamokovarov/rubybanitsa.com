# frozen_string_literal: true

module Admin
  class JobsController < Admin::ApplicationController
    def index
      @jobs = scope Job.includes(:company)
    end

    def show
      @job = Job.find params[:id]
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new job_params

      if @job.save
        redirect_to admin_jobs_path, notice: "Job created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @job = Job.find params[:id]

      render :show
    end

    def update
      @job = Job.find params[:id]

      if @job.update job_params
        redirect_to admin_jobs_path, notice: "Job updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Job.find(params[:id]).destroy

      redirect_to admin_jobs_path, notice: "Job deleted"
    end

    def publish
      job = Job.find(params[:job_id])
      job.publish

      redirect_to edit_admin_job_url(job), notice: "Job has been published"
    end

    private def job_params
      params.require(:job).permit(
        :company_id, :title, :description, :application_url, :publish_at, :expires_at, :ogp_image, photos: [],
      )
    end
  end
end
