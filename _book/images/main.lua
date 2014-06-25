function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {
    love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH), -- 1 = grass
    love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH), -- 2 = box
    love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH), -- 3 = flowers
    love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH)  -- 4 = boxtop
  }
  
  TileTable = {
  
     { 1, 1, 1 },
     { 1, 4, 1 },
     { 1, 1, 1 },
  }

end

function love.draw()
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = (columnIndex-1)*TileW
      local y = (rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end
end