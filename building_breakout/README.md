# Building Breakout

First thing to do is using our Pong code, is to flip it to be left-right rather than up-down.

```{.lua}
--  the goal of this is make a "1 player pong"
local speed = 5
local ball = { x = 0, y = 0, vx = -speed, vy = speed}
local paddle = 0

function movePaddle()
    if love.keyboard.isDown("left") then
        return -7
    elseif love.keyboard.isDown("right") then
        return 7
    else
        return 0
    end
end

function love.update()
    paddle = paddle + movePaddle()

    -- make sure the paddle doesn't fly off the screen
    if paddle < -350 then paddle = -350 end
    if paddle > 350 then paddle = 350 end

    ball.x = ball.x + ball.vx
    ball.y = ball.y + ball.vy

    -- check the walls
    if math.abs(ball.x) >= 385 then ball.vx = -ball.vx end
    if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end

    -- check if you bit the paddle
    if ball.y > 235 and ball.y < 260 and math.abs(paddle - ball.x) < 60 then
        speed = speed + 0.5
        ball.y = 235
        ball.vx = ball.vx * 0.5 + math.random(-1, 1)
        ball.vy = -speed
    end

    -- check it past the paddle
    if ball.y > 260 then
		ball.y = 0
		ball.vy = -ball.vy
	end

end

function love.draw()
    love.graphics.translate(400, 300)
    -- print location of the ball
    -- love.graphics.print(ball.x .. " " .. ball.y, 0,0)
    love.graphics.rectangle("fill", paddle - 50, 300-50, 100, 20)
    love.graphics.circle("fill", ball.x, ball.y, 15)
end

```

Now we have to add the blocks, which will be destroyed when the ball hits them. One solution is to use a 2d array, firstly lets just print out the blocks, which will just be squares.


```
function love.load()
    map = {
        { 1, 1, 1, 1, 1},
        { 1, 1, 0},
        { 1, 1, 1, 1},
    }

    -- get the number of columns so we can offset correctly
    local cols = 0
    for i=1, table.getn(map) do
        cols = math.max(cols, table.getn(map[i]))
    end

    --calculate offset
    center = {}
    center.x = ((cols/2) + 1) * 64
    center.y = 300
end

...

function love.draw()
    love.graphics.translate(400, 300)
    -- print location of the ball
    love.graphics.print(ball.x .. " " .. ball.y, 0,0)

    love.graphics.rectangle("fill", paddle - 50, 300-50, 100, 20)
    love.graphics.circle("fill", ball.x, ball.y, 15)

    -- draw the map
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
                love.graphics.rectangle("line", x * 64 - center.x, y * 64 - center.y, 64, 64)
            end
        end
    end
end
```

The only tricky part is figuring out how much of the grid we have to offset by. However, we're not quite done yet, we have to deal with collision.

