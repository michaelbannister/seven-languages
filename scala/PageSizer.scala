import akka.actor.{Actor, ActorSystem, Props}

import scala.io.Source

object PageLoader {
  def getPageSize(url: String) = Source.fromURL(url).mkString.length
}

class PageSizer extends Actor {
  override def receive: Receive = {
    case string: String => {
      val length = PageLoader.getPageSize(string)
      sender() ! (string, length)
    }
  }
}

class Reporter extends Actor {
  override def receive: Receive = {
    case (url: String, size: Int) => println(s"Size for ${url}: ${size}")
  }
}

object PageSizerApp extends App {
  val system = ActorSystem("sevenlang")

  val urls = List(
    "https://www.johnlewis.com/",
    "https://www.asos.com/",
    "https://www.waitrose.com/",
    "https://www.debenhams.com/")

  val reporter = system.actorOf(Props[Reporter], "reporter")
  for (url <- urls) {
    system.actorOf(Props[PageSizer]).!(url)(reporter)
    // alternative syntax:
    // system.actorOf(Props[PageSizer]).tell(url, reporter)
  }
  Thread.sleep(5000)
  system.terminate()
}