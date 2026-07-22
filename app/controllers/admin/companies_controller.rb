# frozen_string_literal: true

module Admin
  class CompaniesController < Admin::ApplicationController
    def index
      @companies = scope Company.with_attached_thumbnail
    end

    def show
      @company = Company.find params[:id]
    end

    def new
      @company = Company.new
    end

    def create
      @company = Company.new company_params

      if @company.save
        redirect_to admin_companies_path, notice: "Company created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @company = Company.find params[:id]

      render :show
    end

    def update
      @company = Company.find params[:id]

      if @company.update company_params
        redirect_to admin_companies_path, notice: "Company updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Company.find(params[:id]).destroy

      redirect_to admin_companies_path, notice: "Company deleted"
    end

    private def company_params
      params.require(:company).permit(:name, :description, :logo, :thumbnail, photos: [])
    end
  end
end
