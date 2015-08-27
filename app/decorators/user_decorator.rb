class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def name
    return 'You' if object == current_user

    object.name || object.email
  end
end
