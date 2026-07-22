# frozen_string_literal: true

module Admin
  class SponsorshipsController < Admin::ApplicationController
    def index
      @sponsorships = scope Sponsorship.includes(:event, :company)
    end

    def show
      @sponsorship = Sponsorship.find params[:id]
    end

    def new
      @sponsorship = Sponsorship.new
    end

    def create
      @sponsorship = Sponsorship.new sponsorship_params

      if @sponsorship.save
        redirect_to admin_sponsorships_path, notice: "Sponsorship created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @sponsorship = Sponsorship.find params[:id]

      render :show
    end

    def update
      @sponsorship = Sponsorship.find params[:id]

      if @sponsorship.update sponsorship_params
        redirect_to admin_sponsorships_path, notice: "Sponsorship updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Sponsorship.find(params[:id]).destroy

      redirect_to admin_sponsorships_path, notice: "Sponsorship deleted"
    end

    private def sponsorship_params
      params.require(:sponsorship).permit(:event_id, :company_id)
    end
  end
end
