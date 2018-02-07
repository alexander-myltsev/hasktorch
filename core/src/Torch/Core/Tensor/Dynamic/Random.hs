{-# LANGUAGE InstanceSigs #-}
module Torch.Core.Tensor.Dynamic.Random where

import Foreign
import Foreign.C.Types
import GHC.Int
import qualified TensorRandom as Sig
import qualified Torch.Class.Tensor.Random as Class
import THTypes

import Torch.Core.Types

instance Class.TensorRandom Tensor where
  random :: Tensor -> Ptr CTHGenerator -> IO ()
  random t g = _withTensor t $ \ t' -> Sig.c_random t' g

  clampedRandom :: Tensor -> Ptr CTHGenerator -> Int64 -> Int64 -> IO ()
  clampedRandom t g l0 l1 = _withTensor t $ \ t' -> Sig.c_clampedRandom t' g (CLLong l0) (CLLong l1)

  cappedRandom :: Tensor -> Ptr CTHGenerator -> Int64 -> IO ()
  cappedRandom t g l0 = _withTensor t $ \ t' -> Sig.c_cappedRandom t' g (CLLong l0)

  geometric :: Tensor -> Ptr CTHGenerator -> HsAccReal -> IO ()
  geometric t g ar = _withTensor t $ \ t' -> Sig.c_geometric t' g (hs2cAccReal ar)

  bernoulli :: Tensor -> Ptr CTHGenerator -> HsAccReal -> IO ()
  bernoulli t g ar = _withTensor t $ \ t' -> Sig.c_bernoulli t' g (hs2cAccReal ar)

  bernoulli_FloatTensor :: Tensor -> Ptr CTHGenerator -> Ptr CTHFloatTensor -> IO ()
  bernoulli_FloatTensor t g ft = _withTensor t $ \ t' -> Sig.c_bernoulli_FloatTensor t' g ft

  bernoulli_DoubleTensor :: Tensor -> Ptr CTHGenerator -> Ptr CTHDoubleTensor -> IO ()
  bernoulli_DoubleTensor t g dt = _withTensor t $ \ t' -> Sig.c_bernoulli_DoubleTensor t' g dt

  uniform :: Tensor -> Ptr CTHGenerator -> HsAccReal -> HsAccReal -> IO ()
  uniform t g ar0 ar1 = _withTensor t $ \ t' -> Sig.c_uniform t' g (hs2cAccReal ar0) (hs2cAccReal ar1)

  normal :: Tensor -> Ptr CTHGenerator -> HsAccReal -> HsAccReal -> IO ()
  normal t g ar0 ar1 = _withTensor t $ \ t' -> Sig.c_normal t' g (hs2cAccReal ar0) (hs2cAccReal ar1)

  normal_means :: Tensor -> Ptr CTHGenerator -> Tensor -> HsAccReal -> IO ()
  normal_means t0 g t1 ar = _with2Tensors t0 t1 $ \ t0' t1' -> Sig.c_normal_means t0' g t1' (hs2cAccReal ar)

  normal_stddevs :: Tensor -> Ptr CTHGenerator -> HsAccReal -> Tensor -> IO ()
  normal_stddevs t0 g ar t1 = _with2Tensors t0 t1 $ \ t0' t1' -> Sig.c_normal_stddevs t0' g (hs2cAccReal ar) t1'

  normal_means_stddevs :: Tensor -> Ptr CTHGenerator -> Tensor -> Tensor -> IO ()
  normal_means_stddevs t0 g t1 t2 = _with3Tensors t0 t1 t2 $ \ t0' t1' t2' -> Sig.c_normal_means_stddevs t0' g t1' t2'

  exponential :: Tensor -> Ptr CTHGenerator -> HsAccReal -> IO ()
  exponential t g ar = _withTensor t $ \ t' -> Sig.c_exponential t' g (hs2cAccReal ar)

  standard_gamma :: Tensor -> Ptr CTHGenerator -> Tensor -> IO ()
  standard_gamma t0 g t1 = _with2Tensors t0 t1 $ \ t0' t1' -> Sig.c_standard_gamma t0' g t1'

  cauchy :: Tensor -> Ptr CTHGenerator -> HsAccReal -> HsAccReal -> IO ()
  cauchy t g ar0 ar1 = _withTensor t $ \ t' -> Sig.c_cauchy t' g (hs2cAccReal ar0) (hs2cAccReal ar1)

  logNormal :: Tensor -> Ptr CTHGenerator -> HsAccReal -> HsAccReal -> IO ()
  logNormal t g ar0 ar1 = _withTensor t $ \ t' -> Sig.c_logNormal t' g (hs2cAccReal ar0) (hs2cAccReal ar1)

  multinomial :: Ptr CTHLongTensor -> Ptr CTHGenerator -> Tensor -> Int32 -> Int32 -> IO ()
  multinomial lt g t i0 i1 = _withTensor t $ \ t' -> Sig.c_multinomial lt g t' (CInt i0) (CInt i1)

  multinomialAliasSetup  :: Tensor -> Ptr CTHLongTensor -> Tensor -> IO ()
  multinomialAliasSetup t0 g t1 = _with2Tensors t0 t1 $ \ t0' t1' -> Sig.c_multinomialAliasSetup t0' g t1'

  multinomialAliasDraw   :: Ptr CTHLongTensor -> Ptr CTHGenerator -> Ptr CTHLongTensor -> Tensor -> IO ()
  multinomialAliasDraw lt0 g lt1 t = _withTensor t $ \ t' -> Sig.c_multinomialAliasDraw lt0 g lt1 t'
