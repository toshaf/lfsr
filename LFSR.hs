module LFSR where

import CLaSH.Prelude
import qualified Data.Word as W

lfsr :: W.Word16 -> () -> (W.Word16, W.Word16)
lfsr r () = (v, v)
	where
		v = (shiftL r 1) .|. b
		b = 1 .&. ((s 15) `xor` (s 13) `xor` (s 12) `xor` (s 10))
		s = shiftR r

topEntity :: Signal () -> Signal W.Word16
topEntity = mealy lfsr 1

-- NOTE: mealy :: (s -> i -> (s, o)) -> s -> Signal i -> Signal o
