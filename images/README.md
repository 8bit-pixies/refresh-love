# Images

```
function love.load()

  Tileset = love.graphics.newImage('countryside.png')

  TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

  GrassQuad = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  BoxQuad = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  FlowersQuad = love.graphics.newQuad(0, 32, tileW, tileH, tilesetW, tilesetH)
  BoxTopQuad = love.graphics.newQuad(32, 32, tileW, tileH, tilesetW, tilesetH)

end
```


Like many tilesets the best way to construct one is using powers of two. To get `LOVE` to split tiles into a group of four we use the function `love.graphics.newQuad`.

To draw this we can use:

```
love.graphics.draw(Tileset, GrassQuad, 464, 268)
```

which will draw the tileset at the location 464, 268, and so on.

The whole code would be `main.lua`:


```
function love.load()

  Tileset = love.graphics.newImage('countryside.png')

  local tileW, tileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

  GrassQuad = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  BoxQuad = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  FlowersQuad = love.graphics.newQuad(0, 32, tileW, tileH, tilesetW, tilesetH)
  BoxTopQuad = love.graphics.newQuad(32, 32, tileW, tileH, tilesetW, tilesetH)

end

function love.draw()
  love.graphics.draw(Tileset, GrassQuad, 464, 268)
end
```
