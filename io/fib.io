fib := method(n,
if (n == 1 or n == 2, 1, fib(n - 1) + fib(n - 2))
)

for(i, 1, 10, "fib(#{i}) = #{fib(i)}" interpolate println)



fib_it := method(n,
  a := 0
  b := 1
  if (n < 1, Exception raise("Invalid argument " .. n))
  i := 1
  for(i, 1, n,
    next := a + b
    a = b
    b = next
  )
  a
)

e := try(
  fib_it(0)
)
e catch(Exception,
  "caught exception:" println
  "   " print
  e error println
)

for(i, 1, 10, "fib_it(#{i}) = #{fib_it(i)}" interpolate println)
