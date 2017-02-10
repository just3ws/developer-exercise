# Basic Strategy Patterns   

[Blackjack: Basic strategy](https://en.wikipedia.org/wiki/Blackjack#Basic_strategy)

Columns

1. Hand type
2. Hand pattern
3. Dealer upcard value

## Pairs Patterns

### Pair vs Dealer Upcard: HIT

|------|-----|---|
| HARD | 2,2 | * |
| HARD | 3,3 | * |
| HARD | 4,4 | * |
| HARD | 5,5 | * |
|------|-----|---|

|------|-----|------|
| HARD | 6,6 | >= 8 |
| HARD | 7,7 | >= 8 |
|------|-----|------|

### Pair vs Dealer Upcard: STAND

|------|-------|---|
| HARD | 10,10 | * |
| HARD | 8,8   | * |
| HARD | 9,9   | * |
| SOFT | A,A   | * |
|------|-------|---|

|------|-----|-----|
| HARD | 6,6 | 2-6 |
| HARD | 7,7 | 2-7 |
|------|-----|-----|

## Non-pair Patterns

### Non-pair vs Dealer Upcard: HIT

|------|-----|---|
| SOFT | A,2 | * |
| SOFT | A,3 | * |
| SOFT | A,4 | * |
| SOFT | A,5 | * |
| SOFT | A,6 | * |
|------|-----|---|

|------|-----|------|
| SOFT | A,7 | >= 9 |
|------|-----|------|

### Non-pair vs Dealer Upcard: STAND

|------|-----|---|
| SOFT | A,8 | * |
| SOFT | A,9 | * |
|------|-----|---|

|------|-----|-----|
| SOFT | A,7 | 2-8 |
|------|-----|-----|

## Point values

### Point value vs Dealer Upcard: HIT

|------|----|---|
| HARD | 5  | * |
| HARD | 6  | * |
| HARD | 7  | * |
| HARD | 8  | * |
| HARD | 9  | * |
| HARD | 10 | * |
| HARD | 11 | * |
|------|----|---|

|------|----|------|
| HARD | 12 | 2-3  |
| HARD | 12 | >= 7 |
| HARD | 13 | >= 7 |
| HARD | 14 | >= 7 |
| HARD | 15 | >= 7 |
| HARD | 16 | >= 7 |
|------|----|------|

### Point value vs Dealer Upcard: STAND

|------|----|---|
| HARD | 17 | * |
| HARD | 18 | * |
| HARD | 19 | * |
| HARD | 20 | * |
|------|----|---|

|------|----|-----|
| HARD | 12 | 4-6 |
| HARD | 13 | 2-6 |
| HARD | 14 | 2-6 |
| HARD | 15 | 2-6 |
| HARD | 16 | 2-6 |
|------|----|-----|
