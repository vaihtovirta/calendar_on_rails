require "rails_helper"

feature "User creates new event", js: true do
  let(:user) { create(:user) }
  let(:event_title) { "The Event" }

  def click_event_plus
    first(".events").hover
    first(".calendar--add-button").click_link("add")
    wait_for_ajax
  end

  def fill_form_and_submit
    fill_in "event[title]", with: event_title
    fill_in "event[description]", with: FFaker::Lorem.sentence
    click_button("Submit")
    wait_for_ajax
  end

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario "user sees his event" do
    visit events_path

    click_event_plus
    fill_form_and_submit

    expect(page).to have_css(".event--list-item", text: event_title)
  end
end
