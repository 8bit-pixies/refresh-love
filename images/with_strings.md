# ...with strings

Instead of declaring a table to be our tileset, perhaps a simplier way is to use a multi-line string and then parse it.

Firstly, have the mapping for the multiline string:


```
local quadInfo = {
  { '.', 0,   0 }, -- 1 = grass
  { '#', 32,  0 }, -- 2 = box
  { '*', 0,  32 }, -- 3 = flowers
  { '^', 32, 32 }  -- 4 = boxTop
}
```

Then based on this maping we can create our picture:

```
local tileString = [[
...
.#*.
...
]]

```

The next step is to convert it to the `TileTable` which we can then draw using `love.draw()`.

```
TileTable = {}
local width = #(tileString:match("[^\n]+"))
for x=1,width,1 do TileTable[x] = {} end -- initilaise correct dim

local rowIndex, columnIndex = 1,1
for row in tileString:gmatch("[^\n]+") do
  columnIndex = 1
  for chr in row:gmatch(".") do
    TileTable[rowIndex][columnIndex] = chr
    columnIndex = columnIndex + 1
  end
  rowIndex = rowIndex+1
end
```

The trick in the look is the `gmatch`, we can split an iterate over the matches. This makes it quite natural to loop over.

With this in mind, we will have to change our `love.draw()` function.

The whole `main.lua` file:

```
function love.load()

  Tileset = love.graphics.newImage('countryside.png')

  TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

    local quadInfo = {
      {'.', 0, 0},  -- grass
      {'#', 32, 0}, -- box
      {'*', 0, 32}, -- flowers
      {'^',32, 32}  -- boxtop
    }

    Quads = {}
    for _, info in ipairs(quadInfo) do
      -- info[1] = char, info[2] = x, info[3] = y
      Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tilesetW, tilesetH)
    end

  local tileString = [[
...
.#*.
...
]]

  TileTable = {}
  local width = #(tileString:match("[^\n]+"))
  for x=1,width,1 do TileTable[x] = {} end -- initilaise correct dim

  local rowIndex, columnIndex = 1,1
  for row in tileString:gmatch("[^\n]+") do
    columnIndex = 1
    for chr in row:gmatch(".") do
      TileTable[rowIndex][columnIndex] = chr
      columnIndex = columnIndex + 1
    end
    rowIndex = rowIndex+1
  end
end

function love.draw()
  for rowIndex, row in ipairs(TileTable) do
    for colIndex, chr in ipairs(row) do
      local x,y = 250+(colIndex-1)*TileW, 250+(rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[chr], x,y)
    end
  end
end
```


