module Preprocessing where

import Util
  ( mean
  , stdev
  , transpose
  , intercept
  )


-- | Normalize a dataset.
normalize :: [[Double]] -- ^ A dataset.
          -> [[Double]] -- ^ The normalized dataset.
-- Subtract the mean and divide by the standard deviation for each feature.
normalize x = [zipWith (/) (zipWith (-) xi us) os | xi <- x]
  where
    us = map mean $ transpose x -- Mean of each feature.
    os = map stdev $ transpose x -- Standard deviation of each feature.


-- | Split the dataset into input features and targets.
split :: [[Double]]             -- ^ A dataset.
      -> ([[Double]], [Double]) -- ^ Training examples.
split xy p = (intercept x, y)
  where
    x = transpose $ init $ transpose xy
    y = last $ transpose xy
