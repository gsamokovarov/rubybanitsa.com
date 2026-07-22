# frozen_string_literal: true

module Admin
  class ContactsController < Admin::ApplicationController
    def index
      @contacts = scope Contact.includes(:company)
    end

    def show
      @contact = Contact.find params[:id]
    end

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new contact_params

      if @contact.save
        redirect_to admin_contacts_path, notice: "Contact created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @contact = Contact.find params[:id]

      render :show
    end

    def update
      @contact = Contact.find params[:id]

      if @contact.update contact_params
        redirect_to admin_contacts_path, notice: "Contact updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Contact.find(params[:id]).destroy

      redirect_to admin_contacts_path, notice: "Contact deleted"
    end

    private def contact_params
      params.require(:contact).permit(:company_id, :name, :email)
    end
  end
end
