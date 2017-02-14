# Basic Strategy Patterns   

[Blackjack: Basic strategy](https://en.wikipedia.org/wiki/Blackjack#Basic_strategy)

Columns

1. Hand pattern
2. Dealer upcard value

## Pairs Patterns

### Pair vs Dealer Upcard: HIT

| Hand | Upcard |
|------|--------|
| 2,2  | *      |
| 3,3  | *      |
| 4,4  | *      |
| 5,5  | *      |
| 6,6  | >= 8   |
| 7,7  | >= 8   |

### Pair vs Dealer Upcard: STAND

| Hand  | Upcard |
|-------|--------|
| 10,10 | *      |
| 08,08 | *      |
| 09,09 | *      |
| AC,AC | *      |
| 06,06 | 02-06  |
| 07,07 | 02-07  |

## Non-pair Patterns

### Non-pair vs Dealer Upcard: HIT

| Hand  | Upcard |
|-------|--------|
| AC,02   | *      |
| AC,03   | *      |
| AC,04   | *      |
| AC,05   | *      |
| AC,06   | *      |
| AC,07   | >= 9   |

### Non-pair vs Dealer Upcard: STAND

| Hand  | Upcard  |
|-------|---------|
| AC,08   | *       |
| AC,09   | *       |
| AC,07   | 2-8     |

## Point values

### Point value vs Dealer Upcard: HIT

| Hand  | Upcard  |
|-------|---------|
| 5     | *       |
| 6     | *       |
| 7     | *       |
| 8     | *       |
| 9     | *       |
| 10    | *       |
| 11    | *       |
| 12    | 2-3     |
| 12    | >= 7    |
| 13    | >= 7    |
| 14    | >= 7    |
| 15    | >= 7    |
| 16    | >= 7    |

### Point value vs Dealer Upcard: STAND

| Hand  | Upcard  |
|-------|---------|
| 17    | *       |
| 18    | *       |
| 19    | *       |
| 20    | *       |
| 12    | 4-6     |
| 13    | 2-6     |
| 14    | 2-6     |
| 15    | 2-6     |
| 16    | 2-6     |
