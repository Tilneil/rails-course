require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'contacts.db'}

class Contact < ActiveRecord::Base
end

get '/' do 
    @contacts = Contact.all
    erb :post
end

get '/new' do
    erb :new
end

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
    
    redirect '/'
end

get '/edit' do
    @contacts = Contact.find_by(id: params[:id])
    erb :edit
end

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
    
     redirect '/'    
end

get '/delete' do
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    redirect '/'
end


# get '/search' do
#     contact = Contact.all
#     contact.first_name = "%#{params[:first_name]}%"
#     contact.last_name = "%#{params[:last_name]}%"
#     @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", contact.first_name, contact.last_name)    
#   erb :search
# end

get '/search' do
    erb :find
end


post '/results' do
    first_name = params[:first_name_search]
    last_name = params[:last_name_search]
    
    # #go to database user, search for this email typed in the form.
    # contact = Contact.find_by( first_name: '%#{params[:first_name]}%',  last_name: '%#{params[:last_name]}')
    @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", first_name , last_name )    

    # @contacts = Contact.
    # @contact.first_name = Contact.find_by( first_name: params[:first_name] )
    # @contact.last_name = COntact.find_by( last_name: params[:last_name])

    #     # user = User.find_by( email: params[:email] )

    # if @contact.first_name == '%#{params[:first_name]}%' || @contact.last_name == '%#{params[:last_name]}%' 
        erb :results
    # else
    #     erb :contact_not_found
    # end 
end

# get '/results' do

#     erb :results
# end

