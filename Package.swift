// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "UILab",
  products: [
    .library(
      name: "UILab",
      targets: ["UILab"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "UILab",
      dependencies: []
    ),
    .testTarget(
      name: "UILabTests",
      dependencies: ["UILab"]
    ),
  ]
)
