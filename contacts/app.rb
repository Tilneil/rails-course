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

#when the user selects edit, search the contact by the id that is being selected and open the edit form.
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

#when the user selects search from the home page, go to the form 'search'. 
get '/search' do
    erb :find
end

#when the user submits, assign their entries params[...] to the following variables first_name and last_name.
post '/results' do
    first_name = params[:first_name_search]
    last_name = params[:last_name_search]

#access the database table contacts. Assign the variable @contacts to any database entries that are "like" the information the user entered for the variables we assigned earlier. 
    @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", first_name , last_name )  
    erb :results
    
    # @contacts = Contact.all
    
    # if
    #     @contacts.first_name == Contact.where(" first_name LIKE ? ", '%first_name%') || @contacts.last_name == Contact.where(" last_name LIKE ? ", '%last_name%')  
    #     erb :results
        
    # else
    #     erb :contact_not_found

    # end
    
    # "'%first_name%'" users = User.where('age > :lowest_age AND age :highest_age ?',{ lowest_age: 10, highest_age: 20})


#when the use clicks submit, it's linked to the results page. Open the results page and show all the entries that matches the search above.

end