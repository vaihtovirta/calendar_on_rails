require 'rails_helper'

feature 'User edits event', js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:event) { FactoryGirl.create(:event, user: user, periodicity: 2) }
  let(:event_new_title) { FFaker::Lorem.characters(10) }

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario 'user sees his event with new title' do
    visit events_path

    first('.event--list-item', text: event.title).click

    within '#event--form' do
      fill_in 'event[title]', with: event_new_title
      click_button('Submit')
    end

    wait_for_ajax

    expect(page).to have_css('.event--list-item', text: event_new_title)
  end
end
