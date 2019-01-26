require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'contacts.db'}

class Contact < ActiveRecord::Base
end

#go to home page and display "all" contacts we have in the database, with options to create new, update, delete or search contacts.
get '/' do 
    @contacts = Contact.all
    erb :home
end

#open up the webpage with the form for new contacts, the user will enter information here and click.
get '/new' do
    erb :new
end

#the submit button will take the information from the new contact form and save it to the database table with the following columns.
post '/create' do
    contact = Contact.new 
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.phone_number = params[:phone_number]
    contact.email = params[:email]
    contact.address = params[:address]
    contact.city = params[:city]
    contact.state = params[:state]
    contact.zip_code = params[:zip_code]
    contact.save 
#after the user saves, redirect back to the home page. 
    redirect '/'
end

#when the user selects edit, search the contact by the id that is being selected and open the edit form for the user to enter their contact's information.
get '/edit' do
    @contacts = Contact.find_by(id: params[:id])
    erb :edit
end

#save the changes the users enter in the edit form to the database. 
post '/update' do
    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.phone_number = params[:phone_number]
    contact.email = params[:email]
    contact.address = params[:address]
    contact.city = params[:city]
    contact.state = params[:state]
    contact.zip_code = params[:zip_code]
    contact.save 
#redirect back to the home page that shows all the contacts
     redirect '/'    
end

#select the contact by their id, delete the contact. 
get '/delete' do
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    redirect '/'
end

#when the user selects search from the home page, go to the form 'search' to enter their search criteria. 
get '/search' do
    erb :find
end

#when the user submits, assign their entries params[...] to the following variables query.
post '/results' do
    query = "%#{params[:query]}%"
   
#access the database table contacts. Assign the variable @contacts to any database entries that are "like" the information the user entered for the variables we assigned earlier.
#using the if statement if the array for contacts contains information !=0, then display the results page. 
#if it does not contain information =0, then show contact not found page. 
   
    @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", query , query ) 
    
    if @contacts.length != 0
        erb :results
    else
        erb :contact_not_found
    end
end