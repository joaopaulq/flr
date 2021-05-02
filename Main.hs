module Main where

import Text.ParserCombinators.Parsec
import Data.String.CSV

import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V

import Model (train)
import Preprocessing
import Util (transpose)


main :: IO ()
main = do
  -- Lê um arquivo csv de /data e converte pra [[Float]] (?).
  -- let dataset <- parseFromFile csvFile "./data/forestfires.csv"

  csvData <- BL.readFile "./data/forestfires.csv"
    case decode NoHeader csvData of
        Left err -> putStrLn err
        --Right v -> V.forM_ v ( printMyStuff ) --this works
        Right v -> do let mylist = V.toList v :: [[Float]]
        print v --Ta dando erro aqui, mas a ideia eh ler o .csv e colocar ele numa lista de floats
        
  let (w, b) = -- ([random], random)
  let (xtrain, ytrain, xtest, ytest)
    = splitTrainTest $ normalize dataset
  let lr = 0.01
  let maxiter = 100
  let (w', b') = train (w, b) xtrain ytrain lr maxiter
  -- Plota e salva em /logs.
