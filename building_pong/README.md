# Building Pong

Now we will try to build pong, but first lets try to simulate a ball bouncing in a box.


```.lua
local speed = 5
local ball = { x = 0, y = 0, vx = -speed, vy = speed}
local paddle = 0

function love.update()
    ball.x = ball.x + ball.vx
    ball.y = ball.y + ball.vy

    if math.abs(ball.x) >= 385 then ball.vx = -ball.vx end
    if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end


end

function love.draw()
    love.graphics.translate(400, 300)
    love.graphics.circle("fill", ball.x, ball.y, 15)
end
```

How does this work?

# `love.graphics.translate()`

This translate the coordinates system by a factor of 400 (for the x-axis) and 300 (for the y-axis).

This means that the center of the screen (400, 300) is now the centre of our screen, keeping in mind the dimensions of the window is 800 x 600, unless you have changed the defaults.

How do we check whether we've hit a wall?

```
if math.abs(ball.x) >= 385 then ball.vx = -ball.vx end
if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end
```

These two lines work that magic, we hit the wall when the edge of our circle hits -400 or 400, in other words, we need to check from the center of the circle offset by the radius (which is 15). Hence absolute value of 385, 285 is the number required.
