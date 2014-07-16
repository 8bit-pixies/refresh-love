# Reacting to the mouse

```
-- print current mouse location
function love.update()
    X, Y = love.mouse.getPosition()
end

function love.draw()
    love.graphics.print(X .. " " .. Y, 0,0)
end
```

We can see here that the `love.mouse.getPosition()` will show you the position. So now lets get it to react to some objects; like on mouse over change colour of the circle.

# Changing colours

```
-- print current mouse location
local over = false

function setCircleColour()
    if over then love.graphics.setColor(255, 0, 100)
    else love.graphics.setColor(0, 255, 255) end
end

function love.update()
    X, Y = love.mouse.getPosition()

    -- if X, Y are in the circle then over = true (not strictly correct, due to
    -- radius)
    -- mouse coordinates are not translated
    if math.abs(X-400) <= 100 and math.abs(Y-300) <= 100 then over = true
    else over = false
    end
end

function love.draw()
    love.graphics.translate(400, 300)
    setCircleColour()
    love.graphics.print(X .. " " .. Y, -400,-300)
    love.graphics.circle("fill", 0, 0, 100)
end
```

The important things to remember are mouse coordinates are not translated, and to change to colours we have to use `love.graphics.setColor`.

## `love.mouse.isDown("l")`

We can make the colour change when we click on the circle using `love.mouse.isDown("l")`. So the full `main.lua` would look like:

```
-- print current mouse location
local over = false

function setCircleColour()
    if over then love.graphics.setColor(255, 0, 100)
    else love.graphics.setColor(0, 255, 255) end
end

function love.update()
    X, Y = love.mouse.getPosition()

    -- if X, Y are in the rectangle then over = true
    -- mouse coordinates are not translated
    if math.abs(X-400) <= 100 and math.abs(Y-300) <= 100 and love.mouse.isDown("l") then over = true
    else over = false
    end
end

function love.draw()
    love.graphics.translate(400, 300)
    setCircleColour()
    love.graphics.print((X-400) .. " " .. (Y-400), -400,-300)
    love.graphics.rectangle("fill", -100, -100, 200, 200)
end
```



