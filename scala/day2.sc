val list = List("a", "by", "cat", "deed", "enter", "fridge", "gazette", "hedgehog")

for (i <- 1 until list.size) {
  println(list.take(i).foldLeft(0)((acc, word) => acc + word.length))
}


trait MrMackey {
  private val replacements = Map(
    "ass" -> "buns",
    "shit" -> "poo",
    "bitch" -> "bich",
    "fuck" -> "mmkay",
  )
  def censor(text: String) = replacements.foldLeft(text) { (workingText, mapping) =>
     workingText.replaceAllLiterally(mapping._1, mapping._2)
  }
}

class CensoredString(original: String) extends MrMackey {
  override def toString = censor(original)
}

object CensoredString {
  def apply(original: String) = new CensoredString(original)
}

List("kiss my ass",
  "you're a asshole",
  "bullshit",
  "shithead",
  "this shit is cold",
  "it's easy fuck")
  .map(CensoredString(_))
  .foreach(println)
