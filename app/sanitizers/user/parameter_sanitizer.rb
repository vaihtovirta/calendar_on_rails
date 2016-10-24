class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    DEFAULT_PARAMS = %i(
      color
      email
      name
      current_password
      password
      password_confirmation
    ).freeze

    def initialize(*)
      super

      permit(:sign_up, keys: DEFAULT_PARAMS)
      permit(:account_update, keys: DEFAULT_PARAMS)
    end
  end
end
