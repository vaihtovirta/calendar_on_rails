require 'rails_helper'

describe Event do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:title).is_at_most(20) }
    it { is_expected.to belong_to(:user) }
  end

  context '.by_date' do
    before :each do
      FactoryGirl.create_list(:event, 20)
    end

    it 'instantiate objects for recurring events' do
      expect(Event.by_date(Time.now).count >= 20).to be true
      expect(Event.count).to eq 20
    end

    it 'returns nothing if date is not provided' do
      expect(Event.by_date(nil)).to be nil
    end
  end
end
