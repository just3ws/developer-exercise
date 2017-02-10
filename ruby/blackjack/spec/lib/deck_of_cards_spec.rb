# frozen_string_literal: true

require_relative '../../lib/deck_of_cards'

RSpec.describe DeckOfCards do
  it 'has 52 cards' do
    expect(subject.open.count).to eq(52)
  end
end
