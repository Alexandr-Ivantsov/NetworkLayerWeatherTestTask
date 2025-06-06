import ProjectDescription

let project = Project(
    name: "NetworkLayerWeatherTestTask",
    targets: [
        .target(
            name: "NetworkLayerWeatherTestTask",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.NetworkLayerWeatherTestTask",
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
                .external(name: "Alert"),
                .external(name: "Router")
            ]
        ),
        .target(
            name: "NetworkLayerWeatherTestTaskTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.NetworkLayerWeatherTestTaskTests",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "NetworkLayerWeatherTestTask")]
        )
    ]
)


