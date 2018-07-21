(6 / 2) println
(3 / 0) println

Number originalDiv := Number getSlot("/")
Number / = method(divisor,
  if (divisor == 0, 0, self originalDiv(divisor))
)

(6 / 2) println
(3 / 0) println
