require "rails_helper"

describe Events::Populator do
  let(:service) { described_class.new(date) }
  let(:date) { Date.parse("18 May 1990") }

  describe "#call" do
    let!(:recurring_event) { create :event, periodicity: :monthly, starts_at: date }
    let(:month_interval) { [Date.parse("30 April 1990"), Date.parse("3 Jun 1990")] }

    after { service.call }

    it do
      expect(Events::CollectionBuilder)
        .to receive(:new).with(recurring_event, month_interval).and_call_original
    end
  end
end
