# frozen_string_literal: true

module Admin
  class TalksController < Admin::ApplicationController
    def index
      @talks = scope Talk.includes(:event, :speakers)
    end

    def show
      @talk = Talk.find params[:id]
    end

    def new
      @talk = Talk.new
    end

    def create
      @talk = Talk.new talk_params

      if @talk.save
        redirect_to admin_talks_path, notice: "Talk created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @talk = Talk.find params[:id]

      render :show
    end

    def update
      @talk = Talk.find params[:id]

      if @talk.update talk_params
        redirect_to admin_talks_path, notice: "Talk updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Talk.find(params[:id]).destroy

      redirect_to admin_talks_path, notice: "Talk deleted"
    end

    private def talk_params
      params.require(:talk).permit(:title, :description, :url, :presentation, :event_id, speaker_ids: [])
    end
  end
end
