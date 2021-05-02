module Main where

import Preprocessing
import Model
  ( fit
  , predict
  )


main :: IO ()
main = do
  let dataset = [[1, 1, 3, 3], [1, 2, 2, 8], [2, 2, 1, 11],
                 [2, 3, 3, 13], [3, 5, 18, 8], [3, 2, -1, 15]]
  let (w, b) = ([1, 4, 2], -1) -- True values: w = (2, 4, 1), b = -1.
  let (xtrain, ytrain, xtest, ytest) = splitTrainTest dataset 4
  let lr = 0.01
  let maxiter = 10000
  let (w', b') = fit (w, b) xtrain ytrain lr maxiter
  print (w', b')
  print $ map (predict (w', b')) xtest
