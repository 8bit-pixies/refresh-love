# Table

Tables in `lua` are similar to arrays in `python`.

`main.lua`:

```
function love.load()
  GlobalTable = {}
  GlobalTable[1] = "Chapman"
  GlobalTable[2] = "Siu"
  GlobalTable[3] = {1, 2}
end

function love.draw()
  love.graphics.print(GlobalTable[1], 200,200)
  love.graphics.print(GlobalTable[2], 200,220)
  love.graphics.print(GlobalTable[3][1], 250,220)
  love.graphics.print(GlobalTable[3][2], 260,220)
end

```

## Creating an empty table

`{}` denote an empty table.

```
GlobalTable = {}
```

This line declares a global variable which is an empty table.

##Creating a few elements

```
GlobalTable[1] = "Chapman"
GlobalTable[2] = "Siu"
```

Keeping in mind that in `lua`, the indices begin at 1 and not 0, we can easily initalise elements as above.

## Subtables

You can even create subtables in the logical way:

```
GlobalTable[3] = {1, 2}
```

This will create a subtable at the index 3, which is the table `{1,2}`.



