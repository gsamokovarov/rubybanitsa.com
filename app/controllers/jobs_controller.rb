# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    redirect_to root_url
  end

  def show
    @job = Job.find(params[:id])
  end
end
