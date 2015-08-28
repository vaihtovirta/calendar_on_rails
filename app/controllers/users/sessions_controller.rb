module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      flash[:alert] = true
    end
  end
end
