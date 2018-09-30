# frozen_string_literal: true

module Admin
  class JobsController < Admin::ApplicationController
    def publish
      job = Job.find(params[:job_id])
      job.publish

      redirect_to edit_admin_job_url(job), notice: "Job has been published"
    end

    def followup
      job = Job.find(params[:job_id])
      job.followup

      redirect_to edit_admin_job_url(job), notice: "Job has been followed-up"
    end
  end
end
