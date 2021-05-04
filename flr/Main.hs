module Main where

import Preprocessing
import Model
import Util


main :: IO ()
main = do
  -- Cria o dataset manualmente. O último valor de cada exemplo é o target.
  let dataset = [[1, 1, 3, 3], [1, 2, 2, 8], [2, 2, 1, 11],
                 [2, 3, 3, 13], [3, 5, 18, 8], [3, 2, -1, 15],
                 [1, -1, -1, -2], [4, 3, 2, 18], [2, -1, -3, 3]]
  -- Inicia um w e b aletório.
  -- Valores verdadeiros são: w = (2, 4, -1), b = -1.
  let (w, b) = ([13, -8, 3], 5)
  -- Divide o treinamento e teste.
  let (xtrain, ytrain, xtest, ytest) = splitTrainTest dataset 0.6
  -- Normaliza o conjunto de treinamento e de teste. (Com bugs númericos).
  -- let (xtrainNorm, xtestNorm) = (normalize xtrain, normalize xtest)
  -- Roda o gradiente descendente e pega os valores de w e b aprendidos.
  let (w', b') = fit (w, b) xtrain ytrain 0.01 10000
  -- Faz a previsão do conjunto de treinamento.
  let yhat = map (predict (w', b')) xtrain
  putStr "Perda no treinamento: "
  print $ loss ytrain yhat
  putStr "Coeficientes: "
  print w'
  putStr "Interceccao: "
  print b'
  putStr "Previsao do teste: "
  print $ map (predict (w', b')) xtest
  putStr "Previsao esperada: "
  print ytest
