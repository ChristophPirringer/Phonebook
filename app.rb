require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contacts')
require("./lib/email")
require("./lib/phone")
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
  erb(:contact)
end


############
#Phone Class
############

get("/contacts/:id/phone/new")do
  @contact = Contact.find(params.fetch('id').to_i())
  @phone = Phone.find(params.fetch("id").to_i())
  erb(:phone_form)
end

post('/contacts/phone/') do
  phone_number = params.fetch("phone_number")
  phone = Phone.new({:phone_number => phone_number})
  @contact = Contact.find(params.fetch("contact_id").to_i())
  @contact.add_phone(phone)
  erb(:contact)
end


############
#Clear Function
############


get("/clear") do
  Contact.clear()
  erb(:index)
end
