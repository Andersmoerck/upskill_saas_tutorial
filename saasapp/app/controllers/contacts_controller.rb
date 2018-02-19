class ContactsController < ApplicationController
    def new
        @contact = Contact.new #creates a new blank object and stores the values within an instance variable @contact
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to new_contact_path, notice: "Message sent."
        else
            redirect_to new_contact_path, notice: "Error occured."
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
