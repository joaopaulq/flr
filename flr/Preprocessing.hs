module Preprocessing where

import Util
  ( mean
  , stdev
  , transpose
  )

-- | Normalize the dataset by subtract the mean and
-- divide by the standard deviation of each feature.
normalize :: [[Double]] -- ^ A dataset.
          -> [[Double]] -- ^ Normalized dataset.
normalize xs = [zipWith (/) (zipWith (-) x us) os | x <- xs]
  where
    us = map (mean) $ transpose xs
    os = map (stdev) $ transpose xs

-- | Split the dataset and the targets values
-- into training and test sets.
splitTrainTest :: [[Double]]             -- ^ A dataset.
               -> Double                 -- ^ Percentage of examples on the training set.
               -> ([[Double]], [Double],
                   [[Double]], [Double]) -- ^ (training set, training targets, test set, test targets)
splitTrainTest xs p = (take n x, take n y, drop n x, drop n y)
  where
    n = round $ (*p) $ fromIntegral $ length xs
    y = last $ transpose xs
    x = transpose $ init $ transpose xs
