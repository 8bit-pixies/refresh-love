# Hello World

Once `LOVE` is installed, copy the following example and save it as `main.lua`

```{.lua}
function love.load()
  Message = "Hello World!"
  local secret = 'this is a local string'
end

function love.draw()
  love.graphics.print(Message, 200,200)
end
```


To run this code, simply change to the directory and type

```
love .
```

which will run your game.


## `love.load`

`love.load` will run before anything is drawn onto the screen.

## Global Variables

```
Message = "Hello World!"
```

This variable will be available globally not only in this function.

## Local Variables

```
local secret = 'this is a local string'
```

This is a variable which can only be used locally in a function.

## `love.draw`

```
function love.draw()
```

This is the function is called periodically, and is responsibility putting stuff on the screen.

### `love.graphics.print`

This is an _invocation_.






