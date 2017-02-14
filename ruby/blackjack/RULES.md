# Blackjack

Not implemented: bets, insurance, split, surrender, or double/double down

## Phase 1: Player's Turn

```ruby

boxes.each { |player| player.hand.dealt(dealer.deal.face_up!) }

dealer.receive(dealer.deal.face_up!)

boxes.each { |player| player.hand.dealt(dealer.deal.face_up!) }

dealer.receive(dealer.deal)

boxes.each do |player|
  loop do
    break if player.stand?
    if player.hit?
      player.receive(dealer.deal.face_up!)
    end
    break if player.hand.blackjack?
    break if player.hand.bust?
  end
end

```

## Phase 2: Dealer's Turn

```ruby

dealer.hole_card.face_up!

loop do
  break if dealer.stand?
  if dealer.hit?
    dealer.receive(dealer.deal.face_up!)
  end
  break if dealer.blackjack?
  break if dealer.bust?
end

```

## Phase 3: Resolution

```ruby

boxes.each do |player|
  case
  when dealer.hand.bust?
    player.win!
  when dealer.hand.point_total < player.hand.point_total
    player.win!
  when dealer.hand.blackjack? && player.hand.blackjack?
    player.tie!
  when dealer.hand.point_total == player.hand.point_total
    player.tie!
  when dealer.hand.point_total > player.hand.point_total
    player.lose!
  when player.hand.bust?
    player.lose!
  end
end

```

## Hand

Hand is *HARD* until it gets an ACE then it is *SOFT*.

If hand is > 21 then it is *BUST*
If hand is == 21 then it is *BLACKJACK*
Ace + 10/Face then it is *NATURAL BLACKJACK*.

Any *HARD* hand where the possibility to exceed 21 exists by pushing an
additional card namely 12,13,14,15, or 16 is *STIFF*.

## PLAYER State

*winner*
*loser*
*push* (tie/draw)

## References

- http://www.bicyclecards.com/how-to-play/blackjack/
- https://www.blackjackinfo.com/blackjack-rules/
- https://en.wikipedia.org/wiki/Glossary_of_blackjack_terms
- http://www.sportbet.com/casino/Blackjack-Glossary.html
