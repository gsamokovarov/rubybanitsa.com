# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs =
      if params[:demo]
        Job.all
      else
        Job.current
      end
  end

  def show
    @job = Job.find(params[:id])
  end
end
