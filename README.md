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
-i, --max-iterations     Int        0 <= i        Maximum number of iterations, default=100.
-r, --learning-rate      Floating   0 <= r        The learning rate, default=0.01.
-m, --train-percentage   Floating   0 <= m <= 1   % of examples on the training set, default=0.8.
-l, --train-loss         Bool                     Print the loss on the training set, default=True.
-t, --test-accuracy      Bool                     Print accuracy for the test set, default=True if m < 1.
-p, --plot               Bool                     Plot learned hyperplane (.png on `/logs`) default=False.
