require "rails_helper"

describe User do
  subject { create(:user) }

  describe "validation" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to_not allow_value(FFaker::Internet.password(1, 7)).for(:password) }
    it { is_expected.to_not allow_value("valid_email@yandex").for(:email) }
  end

  describe "associations" do
    it { is_expected.to have_many(:events).dependent(:destroy) }
  end
end
