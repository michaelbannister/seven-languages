Matrix := Object clone
Matrix dim := method(x, y,
  m := self clone
  m dim_x := x
  m dim_y := y
  m rows := list()
  for(i, 1, y,
    row := list()
    for(j, 1, x,
      row append(0)
    )
    m rows append(row)
  )
  m dim := method(
    Exception raise("dim should be called on Matrix to construct a new matrix")
  )
  m
)

Matrix print := method(
  for(y, 0, rows size - 1,
    row := rows at(y)
    row join(" ") println
  )
)

# Matrix indices are 1-based
Matrix get := method(x, y,
  if(x > dim_x or x < 1 or y > dim_y or y < 1,
    Exception raise("index out of bounds for matrix dimensions (#{dim_x},#{dim_y})" interpolate)
  )
  rows at(y-1) at(x-1)
)
Matrix set := method(x, y, value,
  rows at(y-1) atPut(x-1, value)
  self
)
Matrix transpose := method(
  t := Matrix dim(dim_y, dim_x)
  rows foreach(j, row,
    row foreach(i, val,
      t set(j+1, i+1, val)
    )
  )
  t
)

Matrix fromFile := method(path,
  f := File with(path) openForReading
  rows := list()

  f foreachLine(line,
    row := line split
    row = row map(asNumber)
    rows append(row)
  )
  f close
  m := Matrix dim(rows at(0) size, rows size)
  m rows := rows
  m
)

Matrix toFile := method(path,
  f := File with(path) remove openForUpdating
  rows foreach(row,
    f write(row join(" "))
    f write("\n")
  )
  f close
)