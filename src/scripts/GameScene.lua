local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

TAGS = {
  Player = 1
}

Z_INDEXES = {
  Player = 100
}

ldtk.load("levels/world.ldtk", false)

class('GameScene').extends()

function GameScene:init()
  self:goToLevel("Level_0")
  self.spawnX = 12 * 16
  self.spawnY = 5 * 16

  self.player = Player(self.spawnX, self.spawnY)
end

function GameScene:goToLevel(level_name)
  gfx.sprite.removeAll()

  for layer_name, layer in pairs(ldtk.get_layers(level_name)) do
    if layer.tiles then
      local tilemap = ldtk.create_tilemap(level_name, layer_name)
      local layerSprite = gfx.sprite.new()
      
      layerSprite:setTilemap(tilemap)
      layerSprite:setCenter(0, 0)
      layerSprite:moveTo(0, 0)
      layerSprite:setZIndex(layer.zIndex)
      layerSprite:add()

      local emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)

      if emptyTiles then
        gfx.sprite.addWallSprites(tilemap, emptyTiles)
      end
    end
  end
end

