# frozen_string_literal: true

RSpec.describe Card do
  subject do
    Card.new(
      suit: :hearts,
      name: :ten,
      rank: 10
    )
  end

  it 'has the correct suit' do
    expect(subject.suit).to eq(:hearts)
  end

  it 'has the correct name' do
    expect(subject.name).to eq(:ten)
  end

  it 'has the correct rank' do
    expect(subject.rank).to eq(10)
  end

  it 'starts face down' do
    expect(subject).to_not be_upcard
    expect(subject).to be_downcard
  end

  describe '#upcard!' do
    it 'it is now an upcard' do
      expect { subject.upcard! }.to change { subject.upcard? }.from(false).to(true)
    end

    it 'it is not a downcard' do
      expect { subject.upcard! }.to change { subject.downcard? }.from(true).to(false)
    end
  end
end
