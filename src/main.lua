
um = nil

ORIGIN = Vector2:new(0, 0)

STAGE = GameObject:new()

DEBUG = true

-- FPS_MODE = 0 -- 0 = 30, 1 = 60

-- function registerFPSItem()
--   menuitem(
--     1,
--     "fps 30"..(FPS_MODE== 0 and "●" or "○").."/60"..(FPS_MODE== 1 and "●" or "○"),
--     handleFPSSwitch
--   )
-- end

-- handleFPSSwitch = function(b)
--   if(FPS_MODE == 0 and b == 2) then
--     FPS_MODE = 1
--     registerFPSItem()
--   elseif (FPS_MODE == 1 and b == 1) then
--     FPS_MODE = 0
--     registerFPSItem()
--   end
--   if(b == 112) then
--     -- any button?
--     run()
--   end
-- end

-- registerFPSItem()

CHAR_POS = Vector2:new(0, 0)

CHAR_SPEED = 0.7

function _init()
  um = UpdateManager:new()
  -- print("init " .. FPS_MODE)
  -- cls()
  axe = GameObject:new({
    position = Vector2:new(40, 15),
    sprite = Sprite:new({
      id = {16, 17, 18, 19, 20, 21, 22, 23},
      fr = 7.5
    })
  })
  STAGE:addChild(axe)
  um:addCallback(function()

    -- print("move")
    local n = btn(2)
    local s = btn(3)
    local e = btn(1)
    local w = btn(0)
    if n then
      CHAR_POS.y = CHAR_POS.y - 1 * CHAR_SPEED
    elseif s then
      CHAR_POS.y = CHAR_POS.y + 1 * CHAR_SPEED
    end
    if e then
      CHAR_POS.x = CHAR_POS.x + 1 * CHAR_SPEED
    elseif w then
      CHAR_POS.x = CHAR_POS.x - 1 * CHAR_SPEED
    end
  end)
end

lf = time()
function _update()
  dt = (time() - lf)*1000
  um:update(dt)
  STAGE:update(dt)
  lf = time()
end


timer = 0

function _draw()
  cls()
  camera(CHAR_POS.x, CHAR_POS.y)
  
  map()
  camera(0, 0)
  if DEBUG then
    print("mem: " .. stat(0))
    print("cpu: " .. stat(1))
  end
  -- timer = timer + .5
  -- camera(timer, timer)
  STAGE:render(ORIGIN)
end