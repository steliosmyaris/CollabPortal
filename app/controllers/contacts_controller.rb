class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts.includes(:contact)
  end

  def create
    @contact = current_user.contacts.build(contact_id: params[:contact_id])
    if @contact.save
      redirect_back fallback_location: root_path, notice: "Contact added!"
    else
      redirect_back fallback_location: root_path, alert: "Could not add contact."
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: "Contact removed."
  end
end