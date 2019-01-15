package sample

import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.server.Directives._
import akka.stream.ActorMaterializer

object WebServer {
	def main(args: Array[String]): Unit = {

    implicit val system = ActorSystem("my-system")
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val route =
      path("") {
        get {
          complete(HttpEntity(ContentTypes.`text/html(UTF-8)`, s"""
            <html>
              <head><title>Hello Istio</title></head>
              <body style="background: ${sys.env("COLOR")}">
                <h1>Say hello to akka-http. Application!</h1>
              </body>
            </html>
            """))
        }
      }
    Http().bindAndHandle(route, "0.0.0.0", 80)
	}
}
