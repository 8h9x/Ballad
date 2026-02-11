// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ballad",
    products: [
        .executable(name: "Ballad", targets: ["Ballad"])
    ],
    targets: [
        .executableTarget(
            name: "Ballad",
        )
    ],
)
