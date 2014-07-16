# Collision

The real magic for this code is just the below:

```
-- check if it hit any of the blocks
for y=1, #map do
    for x=1, #map[y] do
        if map[y][x] == 1 then
            if ball.y < (y * 64 - center.y + 64 + 15) and ball.y > (y * 64 - center.y -15)
                and ball.x > x * 64 - center.x - 15 and ball.x < x * 64 - center.x + 64 +15  then
            map[y][x] = 0
            ball.vx = -ball.vx
            ball.vy = -ball.vy
            end
        end
    end
end
```

I also wanted to make the interaction more similar to the breakout game so I changed the paddle interaction, so that the further away from the centre the ball is struck the deeper the angle it will fly out.

```
-- check if you bit the paddle
if ball.y > 235 and ball.y < 260 and math.abs(paddle - ball.x) < 60 then
    ball.y = 235
    ball.vx = ball.vx - ((paddle -  ball.x)/50) * 5 -- 5 is the factor of the angle
    ball.vy = -speed
end

```

All the magic numbers (which really should be encoded) stands for:

*  64: the width/length of the square blocks.
*  15: the radius of our ball.


And with that we have our game!

`main.lua`:

```
function movePaddle()
    if love.keyboard.isDown("left") then
        return -7
    elseif love.keyboard.isDown("right") then
        return 7
    else
        return 0
    end
end

function love.load()
    speed = 5
    ball = { x = 0, y = 0, vx = 0, vy = speed}
    paddle = 0

    map = {
        { 1, 1, 1, 1, 1},
        { 1, 1, 0},
        { 1, 1, 1, 1},
    }

    -- get the number of columns so we can offset correctly
    local cols = 0
    for i=1, #map do
        cols = math.max(cols, #map[i])
    end

    --calculate offset
    center = {}
    center.x = ((cols/2) + 1) * 64
    center.y = 300
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

    -- check if it hit any of the blocks
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
                if ball.y < (y * 64 - center.y + 64 + 15) and ball.y > (y * 64 - center.y -15)
                    and ball.x > x * 64 - center.x - 15 and ball.x < x * 64 - center.x + 64 +15  then
                map[y][x] = 0
                ball.vx = -ball.vx
                ball.vy = -ball.vy
                end
            end
        end
    end

    -- check if you bit the paddle
    if ball.y > 235 and ball.y < 260 and math.abs(paddle - ball.x) < 60 then
        ball.y = 235
        ball.vx = ball.vx - ((paddle -  ball.x)/50) * 5 -- 5 is the factor of the angle
        ball.vy = -speed
    end

    -- check it past the paddle
    if ball.y > 260 then
        ball = { x = math.random(-5, 5), y = 0, vx = math.random(-1, 1), vy = speed/0.98}
        speed = 5
    end

end

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
