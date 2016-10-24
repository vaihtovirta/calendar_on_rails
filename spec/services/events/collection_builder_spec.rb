require "rails_helper"

describe Events::CollectionBuilder do
  let(:service) { described_class.new(recurring_event, month_interval) }

  describe "#call" do
    let!(:recurring_event) { create :event, periodicity: :monthly, starts_at: Date.parse("18 May 1990") }
    let(:month_interval) { [Date.parse("30 April 1990"), Date.parse("3 Jun 1990")] }

    subject { service.call }

    it { is_expected.to eq([recurring_event]) }
  end
end
