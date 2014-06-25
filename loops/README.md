# Loops

```
function love.load()
  GlobalName = {"Chapman", "Siu"}
  Nested = {{"Red", "Green"}, {1,2}}
end

function love.draw()
  for i=1,6 do
    love.graphics.print(i, 100, 10*i)
  end

  for i=1,#GlobalName do
    love.graphics.print(GlobalName[i], 125, 10*i)
  end

  for i=1,#Nested do
    local subNested = Nested[i]
    for j=1,#subNested do
      love.graphics.print(subNested[j], 150+(50*i),150+(10*j))
    end
  end
end
```

## For

For looks work similar to languages like `SAS` or `VBA`, where the pattern is:

```
for i = 1 to 6 do
  ...
end
```

You can also loop through tables. To loop via the index use `#`

```
for i = 1,#GlobalName do
  ...
end
```

Nested tables can be treated in a similar way, by intermittently storing the subtable in a local variable.

```
for i=1,#Nested do
  local subNested = Nested[i]
  for j=1,#subNested do
    ...
  end
end
```

## Generic Loops

Any loop above can be replaced using a generic loop. It is similar to `python`'s enumerate:

```
for i,el in ipairs(GlobalName) do
  ...
end
```

> What is the difference between `paris` and `ipairs`?


