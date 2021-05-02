module Model where

import Util
  ( dot
  , transpose
  )

-- | Computes the linear regression equation.
predict :: ([Float], Float) -> [Float] -> Float
predict (w, b) x = dot w x + b

-- -- | Computes the mean square error (L2 loss).
-- loss :: [Float] -> [Float] -> Float
-- loss yhat y = 0.5 * m * sum $ map (^2) $ zipWith (-) yhat y
--   where
--     m = fromIntegral $ length y

-- | Performs the gradient descent algorithm.
fit :: ([Float], Float) -- ^ Coefficients.
    -> [[Float]]        -- ^ A dataset.
    -> [Float]          -- ^ Target values.
    -> Float            -- ^ Learning rate.
    -> Int              -- ^ Max number of iterations.
    -> ([Float], Float) -- ^ Updated coefficients.
fit (w, b) xs y lr maxiter
  | maxiter == 0 = (w, b)
  | otherwise    = do
      let k  = zipWith (-) hx y
      let w' = zipWith (-) w $ map (*(lr/m)) $ map (dot k) $ transpose xs
      let b' = b - (lr/m) * sum k
      fit (w', b') xs y lr (maxiter-1)
  where
    m  = fromIntegral $ length w
    hx = map (predict (w, b)) xs
