//
//  WeatherAPI.swift
//  WeatherTestTask
//
//  Created by Александр Иванцов on 28.05.2025.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeather(city: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.weatherapi.com/v1")!
    }
    
    var path: String {
        switch self {
        case .getWeather(_):
            return "/forecast.json"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getWeather(let city):
            let parameters: [String: Any] = [
                "q": city,
                "key": "1a220f38a51f4bb78e2151634252805"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
//    var sampleData: Data {
//        Data()
//    }
    
}
