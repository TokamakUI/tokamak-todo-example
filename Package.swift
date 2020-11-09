// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "tokamak-todo-example",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "tokamak-todo-example", targets: ["tokamak-todo-example"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.5.0")
    ],
    targets: [
        .target(
            name: "tokamak-todo-example",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
    ]
)
