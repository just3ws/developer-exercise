# frozen_string_literal: true

require_relative '../../lib/shuffling_device'

RSpec.describe ShufflingDevice do
  let(:one_deck) { Deck.new.open }
  let(:number_of_decks) { 3 }
  let(:multiple_decks) { Array.new(number_of_decks) { Deck.new.open } }

  it 'has original count of cards after shuffling' do
    expect do
      ShufflingDevice.shuffle!(one_deck)
    end.to_not change { one_deck.count }
  end

  it 'shuffles multiple decks together' do
    expect do
      ShufflingDevice.shuffle!(multiple_decks)
    end.to change { multiple_decks.count }
      .from(number_of_decks).to(number_of_decks * 52)
  end
end
