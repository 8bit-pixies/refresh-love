# Images...with loops

Rather than having each tile as a variable, we can store it in a table:

```
Quads = {
    love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH),
    love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH),
    love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH),
    love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH)
  }

```

This means we can access these simply by their index. We can simplify this even further:

```
local quadInfo = {
  {0, 0},
  {32, 0},
  {0, 32},
  {32, 32}
}

Quads = {}
for i, info in ipairs(quadInfo) do
  -- info[1] = x, info[y] = y
  Quads[i] = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
end
```

## Drawing

We can also use loops to draw! First imagine specifying the `TileTable` which would be the index of the tile we wish to draw:

```
TileTable = {
{1,1,1},
{1,4,2},
{1,1,1},
}
```

We can then loop through this table to draw the appropriate image.

```
function love.draw()
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = 250+(columnIndex-1)*TileW
      local y = 250+(rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end
end
```

The whole `main.lua` would look like this:

```
function love.load()

  Tileset = love.graphics.newImage('countryside.png')

  TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

    local quadInfo = {
      {0, 0},
      {32, 0},
      {0, 32},
      {32, 32}
    }

    Quads = {}
    for i, info in ipairs(quadInfo) do
      -- info[1] = x, info[y] = y
      Quads[i] = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
    end

  TileTable = {
    {1,1,1},
    {1,4,3},
    {1,1,1}
  }
end

function love.draw()
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = 250+(columnIndex-1)*TileW
      local y = 250+(rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end
end
```
