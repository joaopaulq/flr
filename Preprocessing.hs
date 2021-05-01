module Preprocessing where

import Util
  ( mean
  , var
  , stdev
  )


-- Normaliza cada [i, j]: z = ([i, j] - mean([:, j])) / stdev([:, j]).
normalize :: [[Float]] -> [[Float]]
normalize xs =
