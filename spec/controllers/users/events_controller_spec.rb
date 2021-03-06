require "rails_helper"

describe Users::EventsController do
  render_views
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  before { sign_in user }

  describe "GET #index" do
    before { get :index, params: { user_id: user.id } }

    it { is_expected.to render_template("index") }
  end

  describe "GET #new" do
    before { get :new, params: { user_id: user.id } }

    it { is_expected.to redirect_to(events_path) }
  end

  describe "POST #create" do
    before { post :create, params: { user_id: user.id, event: FactoryBot.attributes_for(:event) } }

    it { is_expected.to respond_with(302) }
  end

  describe "GET #edit" do
    before { get :edit, params: { id: event, user_id: user.id } }

    it { is_expected.to redirect_to(events_path) }
  end

  describe "PUT #update" do
    let(:params) do
      {
        id: event,
        user_id: user.id,
        event: FactoryBot.attributes_for(:event).merge(starts_at: event.starts_at)
      }
    end

    before { put :update, params: params }

    it { is_expected.to redirect_to(events_path(start_date: event.starts_at.strftime("%Y-%m-%d"))) }
  end

  describe "DELETE #destroy" do
    before { delete :destroy, params: { id: event, user_id: user.id } }

    it { is_expected.to redirect_to(events_path) }
  end
end
