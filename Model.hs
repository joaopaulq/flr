module Model where

import Test.QuickCheck -- Se for fazer propriedades.

-- Pra ter uma base:
-- https://samcgardner.github.io/2018/10/06/linear-regression-in-haskell.html

-- Produto escalar.
dot :: [Float] -> [Float] -> Float
dot w x = foldr (+) $ zipWith (*) w x

-- Regressão linear.
predict :: [Float] -> [Float] -> Float
predict w x = dot w x

-- Função de perda.
loss :: [Float] -> [Float] -> Float
loss y y_hat = -- TODO

-- Gradiente descendente.
train :: [Float] -> [[Float]] -> [Float]
train w xs = -- TODO

-- propriedades do produto escalar.
