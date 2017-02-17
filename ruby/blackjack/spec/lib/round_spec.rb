# frozen_string_literal: true

RSpec.describe Round do
  let(:table) { Table.new }
  let(:dealer) { Dealer.new }
  let(:player_one) { VirtualPlayer.new }
  let(:player_two) { VirtualPlayer.new }
  let(:player_three) { VirtualPlayer.new }

  describe '#run' do
    context 'ready to start' do
      before do
        dealer.take_ownership_of(game: table)
        player_one.enter(game: table)
        player_two.enter(game: table)
        player_three.enter(game: table)
      end

      it 'should be ready' do
        table.run

        # expect { table.run }
        # .to change { table.dealer.active? }.from(false).to(true)
      end
    end

    context 'not ready to start' do
      it 'complains that the game is not ready' do
        error_message = 'Game is not ready to start'

        expect { table.run }
          .to raise_error(error_message)
      end
    end
  end

  describe '#ready?' do
    it 'starts with an empty game' do
      expect(table)
        .to_not be_ready
    end

    context 'dealer is present without players' do
      it 'is not ready' do
        dealer.take_ownership_of(game: table)

        expect(table)
          .to_not be_ready
      end
    end

    context 'player tries to join without dealer' do
      it 'complains about missing dealer' do
        error_message = 'No dealer to accept player'

        expect { player_one.enter(game: table) }
          .to raise_error(error_message)
        expect(table)
          .to_not be_ready
      end
    end

    context 'a dealer and a player are present' do
      it 'is ready' do
        dealer.take_ownership_of(game: table)
        player_one.enter(game: table)

        expect(table)
          .to be_ready
      end
    end
  end
end
