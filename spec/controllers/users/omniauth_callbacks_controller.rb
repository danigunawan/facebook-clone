# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SessionsController of OnmiAuth' do
  describe 'Sign in and Logout' do
    it 'can sign in user with Facebook account' do
      visit '/'
      page.should have_selector(:link_or_button, 'Sign in with Facebook')
      stub_omniauth

      click_link 'Sign in with Facebook'
      page.should have_content('Super Man')
      page.should have_content('Sign Out')

      click_link 'Sign Out'
      page.should have_content('Sign in with Facebook')
    end
  end
end
