// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import struct ProjectDescription.PackageSettings

let packageSettings = PackageSettings(
    productTypes: [
        "RxSwift": .framework,
        "Moya": .framework,
        "Stevia": .framework,
        "Factory": .framework,
        "Alert": .framework
    ]
)
#endif

let package = Package(
    name: "NetworkLayerWeatherTestTask",
    products: [
        .library(name: "NetworkLayerWeatherTestTask", targets: ["NetworkLayerWeatherTestTask"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.8.0")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/freshOS/Stevia.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/hmlongco/Factory.git", .upToNextMajor(from: "2.5.2")),
        .package(url: "https://github.com/Alexandr-Ivantsov/Alert.git", branch: "main")
    ],
    targets: [
        .target(name: "NetworkLayerWeatherTestTask",
                dependencies: [
                    "RxSwift",
                    .product(name: "RxCocoa", package: "RxSwift"),
                    .product(name: "RxRelay", package: "RxSwift"),
                    "Moya",
                    .product(name: "RxMoya", package: "Moya")
                ])
    ]
)

