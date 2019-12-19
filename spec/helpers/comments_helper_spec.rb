# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentsHelper, type: :helper do
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
