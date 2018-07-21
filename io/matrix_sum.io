matrix_sum := method(matrix,
  matrix map(col, col sum) sum
)

matrix := list(list(1,2,3), list(4,5,6), list(7,8,9))
matrix_sum(matrix) println
(3*2 + 3*5 + 3*8) println
