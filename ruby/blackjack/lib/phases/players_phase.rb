# frozen_string_literal: true

module Phases
  class PlayersPhase
    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      LOG.debug('Phase::PlayersPhase#run'.red)

      deal_an_upcard_to_each_player

      deal_an_upcard_to_the_dealer

      deal_an_upcard_to_each_player

      deal_a_downcard_to_the_dealer

      game.boxes.each do |player|
        22.times do |i|
          raise 'INCONCEIVABLE!' if i >= 21

          case player.decide
          when :stand then break
          when :hit then deal_upcard_to(player)
          end

          case player.tally
          when :blackjack
            player.win!
          when :bust
            player.lose!
          end

          break if player.done?
        end
      end
    end

    def player_decision
      return :stand if player.stand?
      return :hit if player.hit?
      raise
    end

    def player_state
      return :blackjack if player.hand.blackjack?
      # player.hand.blackjack!
      # break
      # end

      return :bust if player.hand.bust?
      # player.hand.bust!
      # break
      # end

      :continue
    end

    def deal_an_upcard_to_each_player
      LOG.debug('#deal_an_upcard_to_each_player'.red)
      game.boxes.each do |player|
        deal_upcard_to(player)
      end
    end

    def deal_upcard_to(player)
      LOG.debug('#deal_upcard_to =>'.red)
      LOG.debug(player.as_json.to_s.yellow)
      game.dealer.deal_upcard_to(player)
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end

    def deal_a_downcard_to_the_dealer
      game.dealer.deal_downcard_to(game.dealer)
    end
  end
end
