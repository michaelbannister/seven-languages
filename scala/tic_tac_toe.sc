case class Square(value: Char) {
  assert(List(' ', 'X', 'O').contains(value), "A square may only contain ' ', 'X', or 'O'")
  
  def empty() = value == ' '

  override def toString = value.toString
}

object Board {
  def fromText(text: String): Board = {
    val lines = text.split('\n').toList
    assert(lines.length == 3, s"A board must have exactly 3 rows; found ${lines.length}")
    assert(lines.forall(_.length == 3), "Each row in a board must be exactly 3 characters")
    val squares = lines.mkString(sep = "").map(Square).toList
    new Board(squares)
  }
}

class Line(squares: List[Square]) {
  def this(first: Square, second: Square, third: Square) = this(List(first, second, third)) 
  assert(squares.size == 3, "A line must have exactly 3 squares!")
  
  def winner() = if (squares.forall(_.equals(squares.head)) && !squares.head.empty) {
    Some(squares.head)
  } else {
    None
  }
}

class Board(squares: List[Square]) {
  assert(squares.size == 9, "A board must have exactly 9 squares!")
  val rows = squares.sliding(3, 3).map(new Line(_)).toList
  val cols = (0 to 2).map { start =>
    new Line(squares.drop(start).sliding(3, 3).map(_.head).toList)
  }.toList
  val diagonal_tl_br = new Line(squares(3*0+0), squares(3*1+1), squares(3*2+2))
  val diagonal_bl_tr = new Line(squares(3*2+0), squares(3*1+1), squares(3*0+2))

  def analyse() = {
    val possibilities: List[Line] = diagonal_bl_tr :: diagonal_tl_br :: List(rows, cols).flatten
    val winner = possibilities.map(_.winner()).filter(_.isDefined).flatten.headOption
    winner match {
      case Some(square) => println(s"Winner is: $square")
      case None => {
        if (!squares.exists(_.empty())) {
          println("No more moves - it's a tie!")
        } else {
          println("There is no winner yet")
        }
      }
    }
  }
  
  override def toString =
    "\n+---+" +
      squares.sliding(3, 3)
        .map(_.mkString(sep = "", start = "|", end = "|"))
        .mkString(sep = "\n", start = "\n", end = "\n") +
      "+---+"
}


val board = Board.fromText(
  """XO 
    | X 
    |OXO""".stripMargin)
board.analyse()

val board1 = Board.fromText(
  """XO 
    | OX
    |OOX""".stripMargin)
board1.analyse()