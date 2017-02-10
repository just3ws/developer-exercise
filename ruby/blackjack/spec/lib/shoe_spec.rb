# frozen_string_literal: true

require_relative '../../lib/shoe'
require_relative '../../lib/house'

RSpec.describe Shoe do
  let(:one_deck_of_cards) { DeckOfCards.new.open }

  subject { Shoe.new(one_deck_of_cards) }

  it 'starts with 52 cards' do
    actual = subject.count
    expected = 52

    expect(actual).to be(expected)
  end

  describe '#draw' do
    it 'decrements the playable card count by one' do
      expect do
        subject.send(:draw)
      end.to change { subject.count }.from(52).to(51)
    end
  end
end
