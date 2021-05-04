module Util where

import Test.QuickCheck

-- Subtraction precision order.
eps :: (Floating a) => a
eps = 1e-7

-- | Computes the dot product of two lists.
dot :: Num a => [a] -> [a] -> a
dot u v = sum $ zipWith (*) u v

-- | Rows becames columns and columns becames rows.
transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose xs     = (map head xs) : transpose (map tail xs)

-- | Computes the arithmetic mean of a list.
mean :: Floating a => [a] -> a
mean x = sum x / n
  where
    n = fromIntegral $ length x

-- | Computes the population variance of a list.
var :: Floating a => [a] -> a
var x = (sum $ map ((^2) . (-) u) x) / n
  where
    u = mean x
    n = fromIntegral $ length x

-- | Computes the standard deviation of a list.
stdev :: Floating a => [a] -> a
stdev x = sqrt $ var x

-- | The dot product respects the commutative property.
prop_dotCommutative :: (Eq a, Num a) => [a] -> [a] -> Bool
prop_dotCommutative u v = (dot u v) == (dot v u)

-- | The sum of deviations of the items from their arithmetic
-- mean is always zero.
prop_meanDeviations :: (Eq a, Ord a, Floating a) => NonEmptyList a -> Bool
prop_meanDeviations (NonEmpty x) = (abs $ (sum $ map ((-) u) x) - 0) <= eps
  where
    u = mean x

-- | Variance is invariant with respect to changes
-- in a location parameter.
prop_varNonNegative :: (Eq a, Ord a, Floating a) => NonEmptyList a -> Bool
prop_varNonNegative (NonEmpty x) = var x >= 0

-- | If a constant is added to all values of the variable,
-- the variance is unchanged.
prop_varAddConstant :: (Eq a, Ord a, Floating a) => NonEmptyList a -> a -> Bool
prop_varAddConstant (NonEmpty x) c = (abs $ var x - var y) <= eps
  where
    y = map (+c) x

-- | If all values are scaled by a constant, the variance is
-- scaled by the square of that constant.
prop_varScaled :: (Eq a, Ord a, Floating a) => NonEmptyList a -> a -> Bool
prop_varScaled (NonEmpty x) c = (abs $ c^2 * var x - var y) <= eps
  where
    y = map (*c) x

-- | If all values are scaled by a constant, the standard deviation is
-- scaled by the absolute value of that constant.
prop_stdevScaled :: (Eq a, Ord a, Floating a) => NonEmptyList a -> a -> Bool
prop_stdevScaled (NonEmpty x) c = (abs $ abs c * stdev x - stdev y) <= eps
  where
    y = map (*c) x
