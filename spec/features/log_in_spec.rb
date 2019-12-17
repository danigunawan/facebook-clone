require 'rails_helper'
# require '../support/request_helper'
require 'spec_helper'
RSpec.feature 'user sign up', type: :feature do  
  scenario 'user needs to sign in' do
    visit root_path
    expect(page).to have_content('sign in')
  end

  scenario 'user can sign up' do
    sign_up_with('izaias@neto.com', 'foobar', 'Izaias', 'Neto')
    expect(page).to have_content('Sign Out')
  end

  scenario 'user can sign in' do
    sign_in
    expect(page).to have_content('Sign Out')
   
  end

  def sign_up_with(email, password, first_name, last_name)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def sign_in
    sign_up_with('izaias@neto.com', 'foobar', 'Izaias', 'Neto')
    click_on 'Sign Out'
    fill_in 'Email', with: 'izaias@neto.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
  end
  
end