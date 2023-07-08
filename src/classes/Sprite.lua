-- @class Sprite
Sprite = {}
Sprite.__index = Sprite

function Sprite:new(opts)
  local self = setmetatable({}, Sprite)

  self.center = opts.center or Vector2.new() -- Center
  self.anim = false
  if type(opts.id) == "table" then
    self.id = opts.id[1] -- Sprite ID from the sprite sheet
    self.anim = true
  else
    self.id = opts.id or 0 -- Sprite ID from the sprite sheet
  end

  self.fr = opts.fr and (1/opts.fr*1000) or 0-- Frame
  self.fd = 0 -- frame delta
  self.fidx = 1 -- frame index

  self.id = opts.id or 0 -- Sprite ID from the sprite sheet

  self.sw = opts.sw or 1 -- Source width
  self.sh = opts.sh or 1 -- Source height
  self.flipX = opts.flipX or false -- Flip X
  self.flipY = opts.flipY or false -- Flip X
  self.r = opts.r or 0 -- Rotation
  
  return self
end

function Sprite:render(x, y)
  if(self.anim == true) then
    spr(self.id[self.fidx], x, y, self.sw, self.sh, self.flipX, self.flipY)
    return 
  end
  spr(self.id, x, y, self.sw, self.sh, self.flipX, self.flipY)
end

function Sprite:update(dt)
  if(self.anim != true) return
  self.fd += dt
  if(self.fd >= self.fr) then
    self.fd = 0
    self.fidx += 1
    if(self.fidx > #self.id) then
      self.fidx = 1
    end
  end
end