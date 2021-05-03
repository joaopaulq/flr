module Main where

import Preprocessing
import Model
import Util


main :: IO ()
main = do
  let dataset = [[1, 1, 3, 3], [1, 2, 2, 8], [2, 2, 1, 11],
                 [2, 3, 3, 13], [3, 5, 18, 8], [3, 2, -1, 15],
                 [1, -1, -1, -2], [4, 3, 2, 18], [2, -1, -3, 3],
                 [2, 2, 1, 11]]
  let (w, b) = ([13, -8, 3], 5) -- True values:
                                -- w = (2, 4, -1)
                                -- b = -1.
  let (xtrain, ytrain, xtest, ytest) = splitTrainTest dataset 0.8
  -- let (xtrainNorm, xtestNorm) = (normalize xtrain, normalize xtest)

  let (w', b') = fit (w, b) xtrain ytrain 0.01 40000
  let yhat = map (predict (w', b')) xtrain

  putStr "Loss on training: "
  print $ loss ytrain yhat
  putStr "Coefficients: "
  print w'
  putStr "Intercept: "
  print b'
  putStr "Test predict: "
  print $ map (predict (w', b')) xtest
  putStr "Test expected: "
  print ytest
