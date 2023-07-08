-- @class GameObject
GameObject = {}
GameObject.__index = GameObject

goIncrement = 0

__GOs = {}

-- Constructor
function GameObject:new(options)
  local opts = options or {}
  local self = setmetatable({}, GameObject)

  goIncrement = goIncrement + 1
  self.id = goIncrement -- ID
  self.name = "GameObject (" .. self.id .. ")" -- Name

  self.position = opts.position or Vector2.new() -- Position
  self.visible = opts.visible or true -- Visible
  self.active = opts.active or true -- Active
  self.sprite = opts.sprite or nil -- Sprite
  self.parent = nil -- Parent
  self.children = {} -- Children

  add(__GOs, self, self.id)
  return __GOs[self.id]
end

function GameObject:__tostring()
  return self.name
end

-- Add a child
function GameObject:addChild(child)
  add(self.children, child)
  child.parent = self
end

function GameObject:removeChild(child)
  del(self.children, child)
  child.parent = nil
end


function GameObject:update(dt)
  if (self.active != true) then
    return
  end

  if self.sprite then
    self.sprite:update(dt)
  end

  for i, child in ipairs(self.children) do
    child:update(dt)
  end
end

function GameObject:render(p_pos)
  if (self.visible != true) then
    return
  end

  if self.sprite then
    local pos = p_pos+self.position
    self.sprite:render(pos.x, pos.y)
  end

  for i, child in ipairs(self.children) do
    child:render(self.position)
  end
end

function GameObject:destroy()
  deli(__GOs, self.id)
  self.parent:removeChild(self)
end