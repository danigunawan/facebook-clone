require 'rails_helper'
# require '../support/request_helper'

RSpec.feature 'user sign up', type: :feature do  
  scenario 'user need to sign in' do
    visit root_path
    expect(page).to have_content('sign in')
  end

  scenario 'user can sign up' do
    sign_up_with('izaias@neto.com', 'foobar', 'Izaias', 'Neto')
    expect(page).to have_content('Sign Out')
  end

  scenario 'user can sign in' do
    sign_in_with
    expect(page).to have_content('Sign Out')
  end
end