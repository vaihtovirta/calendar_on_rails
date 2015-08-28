class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  expose(:show_tip)

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with(*args, options, &blk)
  end

  private

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def devise_parameter_sanitizer
    User::ParameterSanitizer.new(User, :user, params)
  end
end
