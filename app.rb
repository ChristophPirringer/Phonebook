require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contacts')
require("pry")

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
  @contacts = Contact.find(params.fetch("id").to_i())
  erb(:contact)
end
