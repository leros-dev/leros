scalaVersion := "2.13.10"

scalacOptions ++= Seq(
  "-deprecation",
  "-feature",
  "-unchecked",
  "-Xfatal-warnings",
  "-language:reflectiveCalls",
)

// Suppress "there were X feature warnings; re-run with -feature for details".
// These appear because chisel use a language feature that's not available in
// all scala implementations.

// Chisel 3.5
addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.6" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.6"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.6"

libraryDependencies += "io.github.chiselverify" % "chiselverify" % "0.4.0"
