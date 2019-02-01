class ContactsController < ApplicationController
    def index
        @contacts = Contact.all
    end
    
    def new
    end
    
    def create
        @contacts = Contact.new 
        @contacts.first_name = params[:first_name]
        @contacts.last_name = params[:last_name]
        @contacts.phone_number = params[:phone_number]
        @contacts.email = params[:email]
        @contacts.address = params[:address]
        @contacts.city = params[:city]
        @contacts.state = params[:state]
        @contacts.zip_code = params[:zip_code]
        @contacts.save 
        redirect_to '/contacts'
    end

        
    def edit
        @contacts = Contact.find_by(id: params[:id])
    end
    
    def update
        @contacts = Contact.find_by(id: params[:id])
        @contacts.first_name = params[:first_name]
        @contacts.last_name = params[:last_name]
        @contacts.phone_number = params[:phone_number]
        @contacts.email = params[:email]
        @contacts.address = params[:address]
        @contacts.city = params[:city]
        @contacts.state = params[:state]
        @contacts.zip_code = params[:zip_code]
        @contacts.save 
        redirect_to '/contacts'
    end
    
    def destroy
        @contacts = Contact.find_by(id: params[:id])
        @contacts.destroy
        redirect_to '/contacts'
    end

    def search
    end

    def results
        query = "%#{params[:query]}%"
        @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", query , query ) 
    end
end