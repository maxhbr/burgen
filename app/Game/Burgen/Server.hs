module Game.Burgen.Server
  where

import           Control.Concurrent
import           Control.Concurrent.Async
import           Reactive.Banana
import           Reactive.Banana.Frameworks

import Game.Burgen.Types
import Game.Burgen.Persistence

saveStateHandler :: String -> a -- TODO
saveStateHandler fileToSaveIn = undefined

makeBState addUserInputEvent fireUserInputEvent = undefined

run :: String -> IO ()
run fileToSaveIn = do

  (addUserInputEvent, fireUserInputEvent) <- newAddHandler

  actuate =<< compile (let
    bState :: Behavior CompleteState
    bState = makeBState addUserInputEvent fireUserInputEvent
    in changes bState >>= (reactimate' . fmap (saveStateHandler fileToSaveIn)))
