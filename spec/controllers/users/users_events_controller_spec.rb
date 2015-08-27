require 'rails_helper'

describe Users::EventsController do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:event) { FactoryGirl.create(:event, user: user) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    before { get :index, user_id: user.id }
    it { is_expected.to render_template('index') }
  end

  describe 'GET #new' do
    before { get :new, user_id: user.id }
    it { is_expected.to redirect_to(events_path) }
  end

  describe 'GET #create' do
    before { post :create, user_id: user.id, event: FactoryGirl.attributes_for(:event) }
    it { is_expected.to respond_with(302) }
  end

  describe 'GET #edit' do
    before { get :edit, id: event, user_id: user.id }
    it { is_expected.to redirect_to(events_path) }
  end

  describe 'GET #update' do
    before do
      put :update, id: event, user_id: user.id,
                   event: FactoryGirl.attributes_for(:event)
                     .merge(starts_at: event.starts_at)
    end
    it { is_expected.to redirect_to(events_path(start_date: event.starts_at.strftime('%Y-%m-%d'))) }
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, id: event, user_id: user.id
    end
    it { is_expected.to redirect_to(events_path) }
  end
end
