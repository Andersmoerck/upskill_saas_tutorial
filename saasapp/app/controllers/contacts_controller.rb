class ContactsController < ApplicationController
    def new
        @contact = Contact.new #creates a new blank object and stores the values within an instance variable @contact
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][email]
            body = params[:contact][:comments]
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ") #called the flashhash. A hash is a list of key value pair {key: value, key: value}. Here a key called error is created. The value is then derived from the part after the = sign.
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
