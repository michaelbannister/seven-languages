List myAverage := method(
  sum / size
)

Assert equal(3, list(1,5,3) myAverage)
Assert throwsException(list() myAverage)
Assert throwsException(list(1, "a") myAverage)
