# frozen_string_literal: true
require_relative '../../lib/blackjack/deck'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  xit 'starts with 52 playable cards' do
    actual = deck.playable_cards.count
    expected = 52

    expect(actual).to be(expected)
  end

  # def test_dealt_card_should_not_be_included_in_playable_cards
  xit 'does not have cards that have been dealt to players' do
    card = deck.deal_card

    actual = deck.playable_cards

    expect(actual).to_not include(card)
  end

  xit 'has 52 cards after shuffling' do
    deck.shuffle

    actual = deck.playable_cards.count
    expected = 52

    expect(actual).to be(expected)
  end
end
