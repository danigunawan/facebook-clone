# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name , :last_name])
      end

      def after_sign_in_path_for(resource)
        #users_show_url
      end
    ​
      def after_sign_out_path_for(resource)
        # return the path based on resource
      end
   
    
    
    
    
    
end
