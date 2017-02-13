# frozen_string_literal: true

require_relative '../../../lib/blackjack/table'
require_relative '../../../lib/blackjack/dealer'
require_relative '../../../lib/blackjack/player'
require_relative '../../../lib/blackjack/session'

module Blackjack
  RSpec.describe Session do
    subject { Table.new }
    let(:dealer) { Dealer.new }
    let(:player_one) { Player.new }

    describe '#ready?' do
      it 'starts with an empty game' do
        expect(subject)
          .to_not be_ready
      end

      context 'dealer is present without players' do
        it 'is not ready' do
          dealer.take_ownership_of(game: subject)

          expect(subject)
            .to_not be_ready
        end
      end

      context 'player tries to join without dealer' do
        it 'complains about missing dealer' do
          error_message = 'No dealer to welcome player'

          expect { player_one.enter(game: subject) }
            .to raise_error(error_message)
          expect(subject)
            .to_not be_ready
        end
      end

      context 'a dealer and a player are present' do
        it 'is ready' do
          dealer.take_ownership_of(game: subject)
          player_one.enter(game: subject)

          expect(subject)
            .to be_ready
        end
      end
    end

    describe '#start!' do
      context 'not ready to start' do
        it 'complains that the game is not ready' do
          error_message = 'Game is not ready to start'

          expect { subject.start! }
            .to raise_error(error_message)
        end

        context 'ready to start' do
          before do
            dealer.take_ownership_of(game: subject)
            player_one.enter(game: subject)
          end

          it 'should be ready' do
            expect { subject.start! }
              .to change { subject.dealer.active? }.from(false).to(true)
          end
        end
      end
    end
  end
end
