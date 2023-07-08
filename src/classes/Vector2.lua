-- @class Vector2
Vector2 = {}
Vector2.__index = Vector2

-- Constructor
function Vector2:new(x, y)
  local self = setmetatable({}, Vector2)

  self.x = x or 0
  self.y = y or 0
  self[0] = self.x
  self[1] = self.y

  return self
end

function Vector2:__tostring()
  return "Vector2(" .. self.x .. "," .. self.y .. ")"
end

function Vector2:__add(next)
  return Vector2:new(self.x + next.x, self.y + next.y)
end

function Vector2:distance(a, b)
  return sqrt((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2)
end