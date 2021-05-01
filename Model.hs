module Model where

import Util (dot)


-- Regressão linear.
predict :: [Float] -> [Float] -> Float
predict w x = dot w x

-- Função de perda.
loss :: [Float] -> [Float] -> Float
loss y yHat = -- TODO

-- Gradiente descendente.
train :: [Float] -> [[Float]] -> [Float]
train w xs = -- TODO
