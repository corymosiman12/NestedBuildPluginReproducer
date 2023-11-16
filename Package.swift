// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FooPackage",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v13),
        .iOS(.v17),
    ],
    products: [
        .library(name: "FooPackageApp", targets: ["FooPackageApp"]),
    ],
    targets: [
        .target(
            name: "FooPackageApp",
            plugins: [
                .plugin(name: "FooPlugin")
            ]
        ),
        .testTarget(
            name: "FooPackageTests",
            dependencies: [
                "FooPackageApp"
            ]
        ),
        .executableTarget(
            name: "FooGeneratorExecutable",
            path: "Plugins/FooPlugin/Executable"
        ),
        .plugin(
            name: "FooPlugin",
            capability: .buildTool(),
            dependencies: ["FooGeneratorExecutable"],
            path: "Plugins/FooPlugin/BuildPlugin"
        ),

    ]
)
