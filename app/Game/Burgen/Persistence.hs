module Game.Burgen.Persistence
  where

import Data.Serialize

import Game.Burgen.Types

save :: GameId -> CompleteState -> IO ()
save id cs = let
  serialized = encode cs
  in undefined

load :: GameId -> IO CompleteState
load id = undefined
