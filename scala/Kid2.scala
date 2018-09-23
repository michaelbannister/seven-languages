import akka.actor.{Actor, ActorSystem, Props}

import scala.io.StdIn

class Kid2 extends Actor {
  override def receive: Receive = {
    case Poke => {
      say("Ow!")
      say("Stop it!")
    }
    case Feed => {
      say("Gobble")
      say("Chomp")
    }
    case "stop" => context.stop(self)
  }
  def say(str: String): Unit = println(s"${self.path.name}: ${str}")

  override def preStart(): Unit = println(s"Yo! I'm ${self.path.name}")

  override def postStop(): Unit = println(s"${self.path.name} has left the building")
}

object ActorExperiments2 extends App {
  val system = ActorSystem("sevenlang")
  val bart = system.actorOf(Props[Kid2], "Bart")
  val lisa = system.actorOf(Props[Kid2], "Lisa")
  
  bart ! Poke
  lisa ! Poke
  bart ! Feed
  lisa ! Feed
  
  bart ! "stop"
  lisa ! "stop"
  
  system.terminate()
}