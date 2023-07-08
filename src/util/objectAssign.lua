function objectAssign(target, ...)
  for i = 1, select("#", ...) do
    local source = select(i, ...)
    if source ~= nil then
      for key, value in pairs(source) do
        target[key] = value
      end
    end
  end
  return target
end