// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "SincereMusicText",
  platforms: [
      .macOS(.v13),
  ],
  products: [
    .executable(name: "SincereMusicText", targets: ["SincereMusicText"]),
    .library(name: "AppleScriptLib", targets: ["AppleScriptLib"]),
    .library(name: "AppleMusicLib", targets: ["AppleMusicLib"]),
  ],
  dependencies: [
    .package(url: "https://github.com/DanielSincere/SincerePath", from: "0.0.2"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
  ],
  targets: [
    .executableTarget(name: "SincereMusicText",
      dependencies: [
        "SincerePath",
        "AppleMusicLib",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .target(name: "AppleMusicLib", 
      dependencies: ["AppleScriptLib"],
      resources: [.embedInCode("AppleScripts")]),
    .target(name: "AppleScriptLib", 
      dependencies: []),
    .testTarget(name: "AppleScriptLibTests", 
      dependencies: ["AppleScriptLib"]),
  ]
)
