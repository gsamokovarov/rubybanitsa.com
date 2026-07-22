# frozen_string_literal: true

module Admin
  class VenuesController < Admin::ApplicationController
    def index
      @venues = scope Venue.all
    end

    def show
      @venue = Venue.find params[:id]
    end

    def new
      @venue = Venue.new
    end

    def create
      @venue = Venue.new venue_params

      if @venue.save
        redirect_to admin_venues_path, notice: "Venue created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @venue = Venue.find params[:id]

      render :show
    end

    def update
      @venue = Venue.find params[:id]

      if @venue.update venue_params
        redirect_to admin_venues_path, notice: "Venue updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Venue.find(params[:id]).destroy

      redirect_to admin_venues_path, notice: "Venue deleted"
    end

    private def venue_params
      params.require(:venue).permit(:name, :address, :place_id, :online, :directions)
    end
  end
end
