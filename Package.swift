// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Linux)
    let platformTargets: [Target] = [
        .systemLibrary(name: "CX11", pkgConfig: "x11"),
        .systemLibrary(name: "CSkia", path: "Sources/CSkia"),
    ]

    let platformDependencies: [Target.Dependency] = ["CX11", "CSkia"]

    let platformLinkerSettings: [LinkerSetting] = [
        .linkedLibrary("m"),
        .unsafeFlags(["-L/usr/local/lib"]),
        .unsafeFlags(["-L/$HOME/skia/out/Shared"]),
        .unsafeFlags(["-lskia_bridge", "-lskia", "-lstdc++"]),
        .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "/usr/local/lib"]),
        .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "/$HOME/skia/out/Shared"]),
    ]
#else
    let platformTargets: [Target] = []
    let platformDependencies: [Target.Dependency] = []
    let platformLinkerSettings: [LinkerSetting] = []
#endif

let package = Package(
    name: "Ballad",
    products: [
        .executable(name: "Ballad", targets: ["Ballad"])
    ],
    targets: platformTargets + [
        .executableTarget(
            name: "Ballad",
            dependencies: platformDependencies,
            path: "Sources/Ballad",
            linkerSettings: platformLinkerSettings
        )
    ]
)
