class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  decorates_association :user

  def periodicity
    object.periodicity.titleize.downcase
  end

  def description
    object.description.present? ? object.description : 'No description'
  end
end
