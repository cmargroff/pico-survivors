-- @class ParticleEmitter
ParticleEmitter = {}
ParticleEmitter.__index = ParticleEmitter

-- Constructor
function ParticleEmitter.new(opts)
  local self = setmetatable({}, ParticleEmitter)
  local options = objectAssign(opts or {})

  self.x = x or 0 -- X position
  self.y = y or 0 -- Y position
  self.rate = rate or 10 -- Number of particles per second
  self.lifetime = lifetime or 1 -- Lifetime of particles in seconds

  self.particles = {} -- Array to store particles
  self.timer = 0 -- Timer to control particle emission

  return self
end

-- Update function
function ParticleEmitter:update(dt)
  self.timer = self.timer + dt

  -- Emit particles based on the rate
  local particleCount = math.floor(self.rate * self.timer)
  if particleCount > 0 then
    for i = 1, particleCount do
      local particle = Particle.new(self.x, self.y, self.lifetime)
      table.insert(self.particles, particle)
    end

    self.timer = self.timer - particleCount / self.rate
  end

  -- Update and remove particles
  for i = #self.particles, 1, -1 do
    local particle = self.particles[i]
    particle:update(dt)

    if particle:isDead() then
      table.remove(self.particles, i)
    end
  end
end

-- Draw function
function ParticleEmitter:draw()
  for i, particle in ipairs(self.particles) do
    particle:draw()
  end
end
