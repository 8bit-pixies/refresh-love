# Adding one player

```
--  the goal of this is make a "1 player pong"
local speed = 5
local ball = { x = 0, y = 0, vx = -speed, vy = speed}
local paddle = 0

function movePaddle()
    if love.keyboard.isDown("up") then
        return -7
    elseif love.keyboard.isDown("down") then
        return 7
    else
        return 0
    end
end

function love.update()
    paddle = paddle + movePaddle()

    -- make sure the paddle doesn't fly off the screen
    if paddle < -250 then paddle = -250 end
    if paddle > 250 then paddle = 250 end

    ball.x = ball.x + ball.vx
    ball.y = ball.y + ball.vy

    -- check the walls
    if math.abs(ball.x) >= 385 then ball.vx = -ball.vx end
    if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end

    -- check if you bit the paddle
    if ball.x > 325 and ball.x < 350 and math.abs(paddle - ball.y) < 60 then
        speed = speed + 0.5
        ball.x = 325
        ball.vx = -speed
        ball.vy = ball.vy * 0.5 + math.random(-1, 1)
    end

    -- check it past the paddle
    if ball.x > 350 then
		ball.x = -325
		ball.vx = -ball.vx
	end

end

function love.draw()
    love.graphics.translate(400, 300)
    love.graphics.rectangle("fill", 350-10, paddle - 50, 20, 100)
    love.graphics.circle("fill", ball.x, ball.y, 15)
end

```

To add an extra player, the logic follows. Here we have the information on the paddle (which is one dimensional since it can only exist in one plane.

# `love.keyboard.isDown()`

This function checks whether a key is pressed down, which is what is used in this instance.

# Did it hit the paddle?

We can check whether we hit the paddle in the similar way to how we checked whether it hit the wall. Firstly we need to see if the ball has reached the paddle:

```
if ball.x > 325 and ball.x < 350
```

Then we need to check if the paddle is in line with the ball

```
math.abs(paddle - ball.y) < 60
```

And thats it! We have made our pong game.

As an exercise try adding a second player to the game and print the score.




