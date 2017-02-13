# frozen_string_literal: true

require_relative '../log'

module Blackjack
  class Table
    attr_reader :boxes
    attr_accessor :dealer, :shoe

    def initialize(dealer: nil)
      @dealer = dealer

      @shoe = Shoe.new

      @boxes = []

      @state = :inactive
    end

    def welcome(player:)
      raise 'No dealer to welcome player' unless dealer?
      @boxes << player
    end

    def ready?
      dealer? && players?
    end

    def dealer?
      @dealer.instance_of?(Dealer)
    end

    def players?
      @boxes.any? && @boxes.all? { |box| box.instance_of?(Player) }
    end

    def active?
      :active == @state
    end

    def start!
      raise 'Game is not ready to start' unless ready?

      @state = :active
      @dealer.prepare_for_game

      Session.new(game: self).run
    end
  end
end