lazy val app = 
	Project("base", file("."))
		.settings(
			name := "sample-app",
			version := "0.1.0",
			scalaVersion := "2.12.5",
			mainClass in assembly := Some("sample.WebServer"),
			assemblyJarName in assembly := "app.jar",
			libraryDependencies ++= Seq(
				"com.typesafe.akka" %% "akka-http"   % "10.1.1", 
				"com.typesafe.akka" %% "akka-stream" % "2.5.11"
			)
		)

