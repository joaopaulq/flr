module Preprocessing where

import Util
  ( mean
  , stdev
  , transpose
  )

-- | Normalize the dataset by subtract the mean and
-- divide by the standard deviation of each feature.
normalize :: [[Float]] -- ^ A dataset.
          -> [[Float]] -- ^ Normalized dataset.
normalize xs = [zipWith (/) (zipWith (-) x us) os | x <- xs]
  where
    us = map (mean) $ transpose xs
    os = map (stdev) $ transpose xs


-- | Split the dataset and the targets values
-- into training and test sets.
splitTrainTest :: [[Float]]            -- ^ A dataset.
               -> Int                  -- ^ Number of examples in training set.
               -> ([[Float]], [Float],
                   [[Float]], [Float]) -- ^ (training set, training targets, test set, test targets)
splitTrainTest xs n = (take n x, take n y, drop n x, drop n y)
  where
    y = last $ transpose xs
    x = transpose $ init $ transpose xs
