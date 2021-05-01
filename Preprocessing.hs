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
               -> [Float]              -- ^ Targets values.
               -> Int                  -- ^ Number of examples in training set.
               -> ([[Float]], [Float],
                   [[Float]], [Float]) -- ^ (training set, training targets, test set, test targets)
splitTrainTest xs y n = (xtrain, ytrain, xtest, ytrain)
  where
    xtrain = take n xs
    ytrain = take n y
    xtest  = drop n xs
    ytest  = drop n y
