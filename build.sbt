name := """scala-play-jenkins-docker"""
organization := "com.oliveirafernando"

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.13.2"

libraryDependencies += guice
libraryDependencies += "org.scalatestplus.play" %% "scalatestplus-play" % "5.0.0" % Test

// Adds additional packages into Twirl
//TwirlKeys.templateImports += "com.oliveirafernando.controllers._"

// Adds additional packages into conf/routes
// play.sbt.routes.RoutesKeys.routesImport += "com.oliveirafernando.binders._"

mainClass in assembly := Some("play.core.server.ProdServerStart")
fullClasspath in assembly += Attributed.blank(PlayKeys.playPackageAssets.value)

assemblyMergeStrategy in assembly := {
  case PathList("module-info.class", _*) => MergeStrategy.discard
  case PathList("META-INF", _*) => MergeStrategy.discard
  case referenceOverrides if referenceOverrides.contains("reference-overrides.conf") =>
    MergeStrategy.concat
  case a if a.contains("javax/activation") =>
    MergeStrategy.first
  case o =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(o)
}