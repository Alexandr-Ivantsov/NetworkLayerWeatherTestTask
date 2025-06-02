import ProjectDescription

let project = Project(
    name: "WeatherTestTask",
    targets: [
        .target(
            name: "WeatherTestTask",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.WeatherTestTask",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "RxRelay"),
                .external(name: "Moya"),
                .external(name: "RxMoya"),
                .external(name: "Stevia"),
                .external(name: "Factory"),
                .external(name: "Alert")
//                .external(name: "CacheManagerWithoutKeychain")
            ]
        ),
        .target(
            name: "WeatherTestTaskTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.WeatherTestTaskTests",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "WeatherTestTask")]
        )
    ]
)


