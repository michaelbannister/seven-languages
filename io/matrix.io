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


m := Matrix dim(3,4)
m set(1,1,1) set(2,2,2) set(3,3,5) set(1,4,99)
m print
Assert equal(99, m get(1,4))
Assert raisesException(m get(6,2))
Assert raisesException(m get(2,0))

m_t := m transpose
m_t print
Assert equal(99, m_t get(4,1))
