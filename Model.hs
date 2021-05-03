module Model where

import Util
  ( dot
  , transpose
  )

-- | Computes the linear regression equation.
predict :: ([Double], Double) -> [Double] -> Double
predict (w, b) x = dot w x + b

-- | Computes the mean square error (L2 loss).
loss :: [Double] -> [Double] -> Double
loss yhat y = 0.5 * (sum $ map (^2) $ zipWith (-) yhat y) / m
  where
    m = fromIntegral $ length y

-- | Performs the gradient descent algorithm.
fit :: ([Double], Double) -- ^ Coefficients and intercept.
    -> [[Double]]         -- ^ A dataset.
    -> [Double]           -- ^ Target values.
    -> Double             -- ^ Learning rate.
    -> Int                -- ^ Max number of iterations.
    -> ([Double], Double) -- ^ Updated coefficients and intercept.
fit (w, b) xs y lr maxiter
  | maxiter == 0 = (w, b)
  | otherwise    = do
      let cost = zipWith (-) hx y
      let w'   = zipWith (-) w $ map (*(lr/m)) $ map (dot cost) $ transpose xs
      let b'   = b - (lr/m) * sum cost
      fit (w', b') xs y lr (maxiter-1)
  where
    m  = fromIntegral $ length w
    hx = map (predict (w, b)) xs
