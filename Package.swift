// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ballad",
    products: [
        .library(name: "CX11", targets: ["CX11"]),
        .executable(name: "Ballad", targets: ["Ballad"]),
    ],
    targets: [
        .systemLibrary(name: "CX11", pkgConfig: "x11"),
        .executableTarget(
            name: "Ballad",
            dependencies: ["CX11"],
            path: "Sources/Ballad",
        ),
    ],
)
