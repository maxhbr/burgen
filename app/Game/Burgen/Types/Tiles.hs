{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
module Game.Burgen.Types.Tiles
  where

import GHC.Generics
import Data.Serialize

data Color

data DieRoll
  = DieRoll1
  | DieRoll2
  | DieRoll3
  | DieRoll4
  | DieRoll5
  | DieRoll6
  deriving (Eq, Enum, Show, Read, Generic, Serialize)

data GrassTileKind
  = Cow
  | Chicken
  | Sheep
  deriving (Eq, Enum, Show, Read, Generic, Serialize)
data TownTileKind
  = TownTileKind
  deriving (Eq, Enum, Show, Read, Generic, Serialize)
data ScienceTileKind
  = ScienceTileKind
  deriving (Eq, Enum, Show, Read, Generic, Serialize)
data Tile
  = GrassTile GrassTileKind
              Int -- ^ count
  | TownTile TownTileKind
  | ScienceTile ScienceTileKind
  | ShipTile
  | CastleTile
  | MineTile
  | BlackMarketTile
  | GenTile String -- ^ remove
  deriving (Eq, Show, Read, Generic, Serialize)

data TileKind
  = GrassKind
  | TownKind
  | ScienceKind
  | ShipKind
  | CastleKind
  | MineKind
  | BlackMarketKind
  | GenKind -- ^ remove
  deriving (Eq, Enum, Show, Read, Generic, Serialize)

getKind :: Tile -> TileKind
getKind GrassTile{}       = GrassKind
getKind TownTile{}        = TownKind
getKind ScienceTile{}     = ScienceKind
getKind ShipTile{}        = ShipKind
getKind CastleTile{}      = CastleKind
getKind MineTile{}        = MineKind
getKind BlackMarketTile{} = BlackMarketKind
getKind GenTile{}         = GenKind

data Good
  = Good1
  | Good2
  | Good3
  | Good4
  | Good5
  | Good6
