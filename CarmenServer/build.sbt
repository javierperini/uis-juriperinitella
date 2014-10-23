name := "CarmenServer"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache )     

libraryDependencies +=  "CarmenSanDiego" % "CarmenSanDiego" % "0.0.1-SNAPSHOT"

play.Project.playJavaSettings

resolvers += ("m2Repo" at "file://home/javier/.m2/repository")

