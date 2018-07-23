target := Random value(99.5) ceil
guesses := 0
success := false

checkGuess := method(guess,
  if(guess == target,
    success = true,
    guesses = guesses + 1
    if(guess < target, "Higher" println)
    if(guess > target, "Lower" println)
  )
)

"Guess the number I am thinking of..." println

in := File standardInput
while(guesses < 10 and success == false,
  "> " print
  guess := in readLine
  guess = guess asNumber
  if (guess isNan,
    "That wasn't a number. Idiot." println,
    checkGuess(guess)
  )
)
in close

if(success,
  "Yay!" println,
  "Too many guesses - you lose!" println
  "The answer was #{target}" interpolate println
)