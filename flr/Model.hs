module Model where

import Util
  ( dot
  , matmul
  , transpose
  )


-- | Computes the linear regression equation.
predict :: [Double] -- ^ The weights.
        -> [Double] -- ^ A example from the dataset.
        -> Double   -- ^ The predict value.
predict = dot


-- | Computes the cost function (L2 loss).
cost :: [Double] -- ^ Predict values.
     -> [Double] -- ^ Target values.
     -> Double   -- ^ The loss.
cost yhat y = 0.5 * sum $ map (^2) $ zipWith (-) yhat y


-- | Performs the batch gradient descent algorithm.
fit :: [Double]   -- ^ The weights.
    -> [[Double]] -- ^ A dataset.
    -> [Double]   -- ^ The target values.
    -> Double     -- ^ A learning rate.
    -> Int        -- ^ Maximum number of iterations.
    -> [Double]   -- ^ The uptaded weights.
fit w x y lr maxiter
  | maxiter == 0 = w
  | otherwise    = do
      let e  = zipWith (-) hx y -- Error term.
      let dJ = map (*lr) $ matmul e $ transpose x -- Partial derivative term.
      let w' = zipWith (-) w dJ -- Update rule.
      fit w' x y lr (maxiter-1)
  where
    hx = matmul w x -- The hypothesis.
