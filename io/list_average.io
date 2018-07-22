List myAverage := method(
  sum / size
)

Assert equal(3, list(1,5,3) myAverage)
Assert raisesException(list() myAverage)
Assert raisesException(list(1, "a") myAverage)
