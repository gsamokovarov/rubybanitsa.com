class JobsController < ApplicationController
  def index
    @jobs = Job.current
  end

  def show
    @job = Job.find(params[:id])
  end
end