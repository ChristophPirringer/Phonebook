require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the nickname path', {:type => :feature}) do
  it('processes the user entry and returns the contacts nickname') do
    visit('/')
    click_link('You realy have more than one friend? Add them here!!')
    fill_in('nickname', :with => 'Christoph')
    click_button('Add Contact')
    expect(page).to have_content('Christoph')
  end
end
