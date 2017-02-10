# frozen_string_literal: true

require_relative '../lib/where'

RSpec.describe Where do
  let(:boris)   { { name: 'Boris The Blade', quote: "Heavy is good. Heavy is reliable. If it doesn't work you can always hit them.", title: 'Snatch', rank: 4 } }
  let(:charles) { { name: 'Charles De Mar', quote: 'Go that way, really fast. If something gets in your way, turn.', title: 'Better Off Dead', rank: 3 } }
  let(:wolf)    { { name: 'The Wolf', quote: 'I think fast, I talk fast and I need you guys to act fast if you wanna get out of this', title: 'Pulp Fiction', rank: 4 } }
  let(:glen)    { { name: 'Glengarry Glen Ross', quote: 'Put. That coffee. Down. Coffee is for closers only.', title: 'Blake', rank: 5 } }

  let(:fixtures) { [boris, charles, wolf, glen] }

  it 'passes through the values if no pattern provided' do
    actual = fixtures.where
    expected = fixtures

    expect(actual).to be_an_instance_of(Enumerator)
    expect(actual).to match_array(expected)
  end

  it 'finds an exact match' do
    actual = fixtures.where(name: 'The Wolf')
    expected = [wolf]
    expect(actual).to match_array(expected)
  end

  it 'finds a partial match' do
    actual = fixtures.where(title: /^B.*/)

    expected = [charles, glen]
    expect(actual).to match_array(expected)
  end

  it 'finds multiple exact matches' do
    actual = fixtures.where(rank: 4)
    expected = [boris, wolf]

    expect(actual).to match_array(expected)
  end

  it 'finds with multiple criteria' do
    actual = fixtures.where(rank: 4, quote: /get/)
    expected = [wolf]
    expect(actual).to match_array(expected)
  end

  it 'finds with a call chain' do
    actual = fixtures.where(quote: /if/i).where(rank: 3)
    expected = [charles]
    expect(actual).to match_array(expected)
  end
end
