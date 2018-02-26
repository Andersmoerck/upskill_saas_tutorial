class ContactsController < ApplicationController
    def new
        @contact = Contact.new #creates a new blank object and stores the values within an instance variable @contact
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            flash[:error] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
