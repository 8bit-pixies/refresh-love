function love.load()
  Message = "Hello World!"
  local secret = 'this is a local string'
end

function love.draw()
  love.graphics.print(Message, 200,200)
end