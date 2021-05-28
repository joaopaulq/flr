# flr
A functional implementation of linear regression.

## Requirements
- GHC/GHCI
- QuickCheck

## How to use
```
~ ghci
Prelude> :l /flr/Main.hs
Prelude> main [OPTIONS] data.csv
```

## Options
```
-i, --max-iterations    Int         0 <= i    Maximum number of iterations, default=100.
-r, --learning-rate     Floating    0 <= r    The learning rate, default=0.01.
-c, --train-cost        Bool                  Print the cost, default=True.
-a, --train-accuracy    Bool                  Print the accuracy, default=False.
-p, --plot              Bool                  Plot learned hyperplane (.png on `/logs`), default=False.
