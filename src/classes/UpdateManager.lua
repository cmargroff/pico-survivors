--@class UpdateManager
UpdateManager = {}
UpdateManager.__index = UpdateManager

-- Constructor
function UpdateManager:new()
  local self = setmetatable({}, UpdateManager)

  self.callbacks = {}

  return self
end

-- Add a callback
function UpdateManager:addCallback(callback)
  -- add(self.callbacks, cocreate(function()
  --   while true do
  --     callback()
  --     yield()
  --   end
  -- end))
  add(self.callbacks, callback)
end

-- Remove a callback
function UpdateManager:removeCallback(index)
  deli(self.callbacks, index)
end

-- Update function
function UpdateManager:update(dt)

  for i = 1, #self.callbacks do
    self.callbacks[i](dt)
  end

  -- for i, cor in ipairs(self.updateCallbacks) do
  --   -- coresume(cor)
  --   print(type(cor))
  --   cor(dt)
  -- end
end
