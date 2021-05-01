module Main where

import Model (train)
import Preprocessing
import Util (transpose)


main :: IO ()
main = do
  -- Lê um arquivo csv de /data e converte pra [[Float]] (?).
  let dataset = -- TODO
  let (w, b) = -- ([random], random)
  let (xtrain, ytrain, xtest, ytest)
    = splitTrainTest $ normalize dataset
  let lr = 0.01
  let maxiter = 100
  let (w', b') = train (w, b) xtrain ytrain lr maxiter
  -- Plota e salva em /logs.
