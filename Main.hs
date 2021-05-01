module Main where

import Model
import Preprocessing


main :: IO ()
main = do
  -- Lê um arquivo csv de /data.
  -- Converte pra Floats (?).
  -- Preprocessa os dados.
  -- Resolve a bronca do bias.
  -- Treina.
  -- Plota e salva em /logs.
