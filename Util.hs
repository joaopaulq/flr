module Util where


dot :: [Float] -> [Float] -> Float
dot u v = sum $ zipWith (*) u v

mean :: [Float] -> Float
mean x = sum x / n
  where
    n = fromIntegral $ length x

var :: [Float] -> Float
var x = (sum $ map (^2) $ map (+(-u)) x) / (n-1)
  where
    u = mean x
    n = fromIntegral $ length x

stdev :: [Float] -> Float
stdev x = sqrt $ var x
