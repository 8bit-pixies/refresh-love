function love.load()
  GlobalName = {"Chapman", "Siu"}
  Nested = {{"Red", "Green"}, {1,2}}
end

function love.draw()
  for i,j in ipairs(GlobalName) do
    love.graphics.print(j, 100, 10*i) -- will be ontop of each other
  end
end