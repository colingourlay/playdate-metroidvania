-- CoreLibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Libraries
import "scripts/libraries/AnimatedSprite"
import "scripts/libraries/LDtk"

-- Game
import "scripts/GameScene"
import "scripts/Player"

GameScene()

local pd <const> = playdate
local gfx <const> = playdate.graphics

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end
