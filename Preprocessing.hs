module Preprocessing where

import Test.QuickCheck -- Se for fazer propriedades.

-- Média de cada feature do dataset.
mean :: [Float] -> Float
mean x = -- TODO

-- Variância de cada feature do dataset.
var :: [Float] -> Float
var x = -- TODO

-- Desvio padrão de cada feature do dataset.
stdev :: [Float] -> Float
stdev x = -- TODO

-- Normaliza cada coluna x: z = (x - mean(x)) / stdev(x).
normalize :: [[Float]] -> [[Float]]
normalize xs = -- TODO

-- propriedades da variância.
-- propriedades da média.
