import akka.actor.{Actor, ActorSystem, Props}

case object Poke
case object Feed

class Kid extends Actor {
  override def receive: Receive = {
    case Poke => {
      say("Ow!")
      say("Stop it!")
    }
    case Feed => {
      say("Gobble")
      say("Chomp")
    }
  }
  def say(str: String): Unit = println(s"${self.path.name}: ${str}")
}

object ActorExperiments extends App {
  val system = ActorSystem("sevenlang")
  val bart = system.actorOf(Props[Kid], "bart")
  val lisa = system.actorOf(Props[Kid], "lisa")
  println("Ready to poke & feed")
  bart ! Poke
  lisa ! Poke
  bart ! Feed
  lisa ! Feed
  
  system.terminate()
}