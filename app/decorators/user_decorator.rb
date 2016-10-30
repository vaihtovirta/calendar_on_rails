class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  alias user object

  def name
    return "You" if user == current_user

    user.name || user.email
  end
end
