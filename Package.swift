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
//        "CacheManagerWithoutKeychain": .framework
//        "PinLayout": .framework
    ]
)
#endif

let package = Package(
    name: "WeatherTestTask",
    products: [
        .library(name: "WeatherTestTask", targets: ["WeatherTestTask"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.8.0")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/freshOS/Stevia.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/hmlongco/Factory.git", .upToNextMajor(from: "2.5.2")),
        .package(url: "https://github.com/Alexandr-Ivantsov/Alert.git", branch: "main")
//        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git" , .upToNextMajor(from: "1.8.4")),
//        .package(url: "https://github.com/Alexandr-Ivantsov/CacheManagerWithoutKeychain.git", branch: "main")
//        .package(openurl: "https://github.com/layoutBox/PinLayout.git", .upToNextMajor(from: "1.10.5"))
    ],
    targets: [
        .target(name: "WeatherTestTask",
                dependencies: [
                    "RxSwift",
                    .product(name: "RxCocoa", package: "RxSwift"),
                    .product(name: "RxRelay", package: "RxSwift"),
                    "Moya",
                    .product(name: "RxMoya", package: "Moya")
                ])
    ]
)

