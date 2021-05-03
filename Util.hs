module Util where

import Test.QuickCheck

eps = 1e-7 -- Double subtraction precision.


dot :: [Double] -> [Double] -> Double
dot u v = sum $ zipWith (*) u v

transpose :: [[Double]] -> [[Double]]
transpose ([]:_) = []
transpose xs     = (map head xs) : transpose (map tail xs)

mean :: [Double] -> Double
mean x = sum x / n
  where
    n = fromIntegral $ length x

var :: [Double] -> Double
var x = (sum $ map ((^2) . (-) u) x) / n
  where
    u = mean x
    n = fromIntegral $ length x

stdev :: [Double] -> Double
stdev x = sqrt $ var x

-- | The dot product respects the commutative property.
prop_dotCommutative :: [Double] -> [Double] -> Bool
prop_dotCommutative u v = (dot u v) == (dot v u)

-- -- | The operation of taking the transpose is an involution (self-inverse).
-- prop_transposeInvolution :: [[Double]] -> Bool
-- prop_transposeInvolution a = transpose at == a
--   where
--     at = transpose a

-- | Variance is invariant with respect to changes in a location parameter.
-- That is, if a constant is added to all values of the variable,
-- the variance is unchanged.
prop_varNonNegative :: NonEmptyList Double -> Bool
prop_varNonNegative (NonEmpty x) = var x >= 0

-- | If a constant is added to all values of the variable,
-- the variance is unchanged.
prop_varAddConstant :: NonEmptyList Double -> Double -> Bool
prop_varAddConstant (NonEmpty x) c = (abs $ var x - var y) <= eps
  where
    y = map (+c) x

-- | If all values are scaled by a constant, the variance is
-- scaled by the square of that constant.
prop_varScaled :: NonEmptyList Double -> Double -> Bool
prop_varScaled (NonEmpty x) c = (abs $ c^2 * var x - var y) <= eps
  where
    y = map (*c) x
