require 'rails_helper'

feature 'User creates new event', js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let(:event_title) { FFaker::Lorem.characters(10) }

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario 'user sees his event', pending: 'Strange js error related to material-lite' do
    visit events_path

    first('.events').hover

    first('.calendar--add-button').click_link('add')

    wait_for_ajax

    within '#event--form' do
      fill_in 'event[title]', with: event_title
      fill_in 'event[description]', with: FFaker::Lorem.sentence
      click_button('Submit')
    end

    expect(page).to have_css '.event--list-item', event_title
  end
end
