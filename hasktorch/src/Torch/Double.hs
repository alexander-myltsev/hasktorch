{-# LANGUAGE TypeSynonymInstances #-}
module Torch.Double (module X) where

import Numeric.Dimensions as X
import Torch.Types.TH as X
import Torch.Double.NN as X

import Torch.Double.Types as X hiding (storage)
import Torch.Double.Index as X hiding (withDynamicState)
import Torch.Double.Mask as X

import Torch.Indef.Double.Tensor as X
import Torch.Indef.Double.Tensor.Copy as X
import Torch.Indef.Double.Tensor.Index as X
import Torch.Indef.Double.Tensor.Masked as X
import Torch.Indef.Double.Tensor.Math as X
import Torch.Indef.Double.Tensor.Math.Compare as X
import Torch.Indef.Double.Tensor.Math.CompareT as X
import Torch.Indef.Double.Tensor.Math.Pairwise as X
import Torch.Indef.Double.Tensor.Math.Pointwise as X
import Torch.Indef.Double.Tensor.Math.Reduce as X
import Torch.Indef.Double.Tensor.Math.Scan as X
import Torch.Indef.Double.Tensor.Mode as X
import Torch.Indef.Double.Tensor.ScatterGather as X
import Torch.Indef.Double.Tensor.Sort as X
import Torch.Indef.Double.Tensor.TopK as X

import Torch.Indef.Double.Tensor.Math.Pointwise.Signed as X

import Torch.Indef.Double.Tensor.Math.Blas as X
import Torch.Indef.Double.Tensor.Math.Floating as X
import Torch.Indef.Double.Tensor.Math.Lapack as X
import Torch.Indef.Double.Tensor.Math.Pointwise.Floating as X
import Torch.Indef.Double.Tensor.Math.Reduce.Floating as X

import Torch.Indef.Double.Tensor.Math.Random.TH as X
import Torch.Indef.Double.Tensor.Random.TH as X
import Torch.Core.Random as X (newRNG, seed, manualSeed, initialSeed)

-------------------------------------------------------------------------------

import System.IO.Unsafe

instance Dimensions d => Fractional (Tensor d) where
  fromRational = constant . fromRational
  (/) = (^/^)

instance Dimensions d => Floating (Tensor d) where
  pi = X.constant pi
  exp = X.exp
  log = X.log
  sqrt = X.sqrt
  sin = X.sin
  cos = X.cos
  asin = X.asin
  acos = X.acos
  atan = X.atan
  sinh = X.sinh
  cosh = X.cosh

