function love.load()
  GlobalTable = {}
  GlobalTable[1] = "Chapman"
  GlobalTable[2] = "Siu"
  GlobalTable[3] = {1, 2}
end

function love.draw()
  love.graphics.print(GlobalTable[1], 200,200)
  love.graphics.print(GlobalTable[2], 200,220)
  love.graphics.print(GlobalTable[3][1], 250,220)
  love.graphics.print(GlobalTable[3][2], 260,220)
end

