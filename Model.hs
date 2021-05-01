module Model where

import Util (dot, transpose)

-- Computes the linear regression equation.
predict :: ([Float], Float) -> [Float] -> Float
predict (w, b) x = dot w x + b

-- Computes the mean square error (L2 loss).
loss :: [Float] -> [Float] -> Float
loss yhat y = (1/(2*m)) * sum $ map (^2) $ zipWith (-) yhat y
  where
    m = fromIntegral $ length y

-- Performs the gradient descent algorithm.
train :: ([Float], Float) -- ^ Coefficients.
      -> [[Float]]        -- ^ A dataset.
      -> [Float]          -- ^ Targets values.
      -> Float            -- ^ Learning rate.
      -> Int              -- ^ Max number of iterations.
      -> ([Float], Float) -- ^ Updated coefficients.
train (w, b) xs y lr maxiter
  | maxiter == 0 = (w, b)
  | otherwise do
      print $ loss hx y
      let w = w - -- TODO
      let b = b - (lr * (1/m) * sum $ zipWith (-) hx y)
      train (w, b) xs y lr (maxiter-1)
        where
          m  = fromIntegral $ length w
          hx = map (predict w) xs
