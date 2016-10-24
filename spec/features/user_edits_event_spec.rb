require "rails_helper"

feature "User edits event", js: true do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, user: user, periodicity: 2) }
  let(:event_new_title) { "New Event Name" }

  before { login_as(user, scope: :user, run_callbacks: false) }

  def click_on_event
    first(".event--list-item", text: event.title).click
  end

  def edit_event_and_submit
    fill_in "event[title]", with: event_new_title
    click_button("Submit")
    wait_for_ajax
  end

  scenario "user sees his event with new title" do
    visit events_path
    click_on_event
    edit_event_and_submit

    expect(page).to have_css(".event--list-item", text: event_new_title)
  end
end
