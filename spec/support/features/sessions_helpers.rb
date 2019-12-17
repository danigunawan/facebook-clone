module Features
    module SessionHelpers
      def sign_up_with(email, password, first_name, last_name)
        visit new_user_registration_path
        fill_in 'Email', with: email
        fill_in 'First name', with: first_name
        fill_in 'Last name', with: last_name
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_button 'Sign up'
      end
  
      def sign_in_with
        sign_up_with(email, password, first_name, last_name)
        click_on 'Sign Out'
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'
      end
    end
  end