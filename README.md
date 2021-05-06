# flr
A functional implementation of linear regression.

## Requirements
- Linux
- GHC/GHCI
- QuickCheck

## How to use
```
~ ghci
~ Prelude> :l /flr/Main.hs
~ Prelude> main [OPTIONS] "path.csv"
```

## Options
```
-i, --max-iterations       Int     : 0 <= i          Max number of iterations, default=100.
-r, --learning-rate        Floating: 0 <= r          The learning rate, default=0.01.
-m, --train-percentage     Floating: 0 <= m <= 1     Percentage of examples on the training set, default=0.8.
-l, --train-loss           Bool                      Print the loss on the training set, default=True.
-t, --test-accuracy        Bool                      Show the test set accuracy, default=True if m < 1.
-p, --plot                 Bool                      Plot the learned hyperplane, default=False. (.png on `/logs`)
