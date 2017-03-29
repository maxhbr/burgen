{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
module Game.Burgen.Types.State
  where

import GHC.Generics
import Data.Serialize
import qualified Data.Map as Map
import           Data.Map (Map)

import Game.Burgen.Types.Core
import Game.Burgen.Types.Board
import Game.Burgen.Types.Tiles

--------------------------------------------------------------------------------
-- * Player

data Player
  = Player { getPlayerId             :: UserId
           , getPlayerBoard          :: PlayerBoard
           , getCurrentPlayerDieRoll :: [DieRoll]
           , getCurrentPlayerScore   :: Int }
  deriving (Show, Generic, Serialize)

instance Eq Player where
  Player{getPlayerId=p1Id} == Player{getPlayerId=p2Id} = p1Id == p2Id

--------------------------------------------------------------------------------
-- * GameId
newtype GameId = GameId String
  deriving (Show, Eq, Read, Generic, Serialize)

--------------------------------------------------------------------------------
-- * CompleteState
-- data MachineState
--   = Prepare -- ^ the game has not yet been started and only 'Admin' should take actions
--   | WaitForTurn -- ^ last turn was done completly and current player should choose his action
--   | GameOver UserId -- ^ there was already an game ending situation and mentioned user has won, nothing should be able to change the current board

data CompleteState
  = CompleteState { gameId :: GameId
                  , players :: Map UserId Player
                  , centralBoard :: CentralBoard }
  deriving (Show, Eq, Generic, Serialize)

