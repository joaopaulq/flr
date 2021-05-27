module Main where

import Preprocessing
import Model
import Util


main :: IO ()
main = do
  let dataset = [[1, 1, 3, 3], [1, 2, 2, 8], [2, 2, 1, 11],
                 [2, 3, 3, 13], [3, 5, 18, 8], [3, 2, -1, 15],
                 [1, -1, -1, -2], [4, 3, 2, 18], [2, -1, -3, 3]]
  let w = [13, -8, 3, 5]
  let (x, y) = split dataset

  let w' = fit w x y 0.01 10000
  let yhat = matmul w' x
  
  putStr "Cost: "
  print $ cost y yhat
  putStr "Weights: "
  print w'
