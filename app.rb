require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contacts')
require("./lib/email")
require("pry")


############
#Contact Class
############

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

get('/contacts/new') do
  erb(:contacts_form)
end

post("/") do
  nickname = params.fetch("nickname")
  Contact.new({:nickname => nickname}).save()
  @contacts = Contact.all()
  erb(:index)
end

get("/contacts/:id") do
  @contact = Contact.find(params.fetch("id").to_i())
  # binding.pry
  # @email = Email.find(params.fetch("email_id").to_i())
  erb(:contact)
end


############
#Email Class
############

get("/contacts/:id/email/new")do
  @contact = Contact.find(params.fetch('id').to_i())
  @email = Email.find(params.fetch("id").to_i())
  erb(:email_form)
end

post('/contacts') do
  email_address = params.fetch("email_address")
  email = Email.new({:email_address => email_address})
  @contact = Contact.find(params.fetch("contact_id").to_i())
  @contact.add_email(email)
  # binding.pry
  erb(:contact)
end
