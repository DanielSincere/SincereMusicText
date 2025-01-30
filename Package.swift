// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "SincereMusicText",
  platforms: [
      .macOS(.v13),
  ],
  products: [
    .executable(name: "SincereMusicText", targets: ["SincereMusicText"]),
  ],
  dependencies: [
    .package(url: "https://github.com/DanielSincere/SincerePath", from: "0.0.2"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
  ],
  targets: [
    .executableTarget(
      name: "SincereMusicText",
      dependencies: [
        "SincerePath",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ],
      resources: [
        .embedInCode("AppleScripts")
      ]
    )
  ]
)
