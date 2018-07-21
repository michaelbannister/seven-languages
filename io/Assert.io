Assert := Object clone

Assert equal := method(expected, actual,
if ((expected) == (actual),
  "Pass: #{call message argAt(1)} == #{expected}" interpolate println,
  "Fail: expected #{call message argAt(1)} to equal [#{expected}] but was [#{actual}]" interpolate println)
)

Assert throwsException := method(
  e := try(call evalArgAt(0))
  if (e isNil,
    "Fail: expected exception to be thrown by: #{call message argAt(0)}" interpolate println,
    "Pass: exception thrown: #{e error}" interpolate println
  )
)
