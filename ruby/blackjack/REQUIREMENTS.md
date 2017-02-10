# Simplified Blackjack

`blackjack.rb` contains initial work on a Blackjack simulation.

## Acceptance Criteria

- As a Player I can get a hand with two cards in it
- As a Dealer I can get a hand with two cards in it
- As a Player I can see what card the dealer is showing
- As a Player I can bust (lose immediately) when I am getting cards
- As a Player I can blackjack (win immediately) when I am dealt cards (this is
  a simplification)
- As a Dealer I can draw cards after the player until I win or lose

Please use your discretion in fixing/adding tests. You are free to use/convert
to any testing framework you want.

## Bonus

- Simulate a random round of the game (you don't have to write educated player
  decision logic - it could be just guesses)

## Rules

- **Bust**: Occurs when all possible hand values are greater than 21 points
- **Blackjack**: Occurs when a player or dealer is dealt an ace and a 10-point
  card
- **Dealer**: Stays on 17 or above

For more information on blackjack, please refer to the
[wiki](http://en.wikipedia.org/wiki/Blackjack).
