require 'rails_helper'

describe EventsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:event) { FactoryGirl.create(:event, user: user) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to render_template('index') }
  end

  describe 'GET #show' do
    before { get :show, id: event }
    it { is_expected.to render_template('show') }
  end
end
