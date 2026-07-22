# frozen_string_literal: true

module Admin
  class SpeakersController < Admin::ApplicationController
    def index
      @speakers = scope Speaker.with_attached_avatar
    end

    def show
      @speaker = Speaker.find params[:id]
    end

    def new
      @speaker = Speaker.new
    end

    def create
      @speaker = Speaker.new speaker_params

      if @speaker.save
        redirect_to admin_speakers_path, notice: "Speaker created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @speaker = Speaker.find params[:id]

      render :show
    end

    def update
      @speaker = Speaker.find params[:id]

      if @speaker.update speaker_params
        redirect_to admin_speakers_path, notice: "Speaker updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Speaker.find(params[:id]).destroy

      redirect_to admin_speakers_path, notice: "Speaker deleted"
    end

    private def speaker_params
      params.require(:speaker).permit(:name, :description, :github_url, :twitter_url, :avatar)
    end
  end
end
