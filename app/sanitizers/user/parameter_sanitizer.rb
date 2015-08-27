class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    def sign_up
      default_params.permit(:name, :email, :password,
                            :password_confirmation, :color)
    end

    def account_update
      default_params.permit(:name, :email, :password, :password_confirmation,
                            :current_password, :color)
    end
  end
end
