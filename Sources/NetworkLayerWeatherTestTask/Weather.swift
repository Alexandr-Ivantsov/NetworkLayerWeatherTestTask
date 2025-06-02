//
//  Weather.swift
//  WeatherTestTask
//
//  Created by Александр Иванцов on 28.05.2025.
//

import Foundation

public struct Weather: Codable {
    let forecast: [ForecastDay]?
    
}

public struct ForecastDay: Codable {
    let date: Date?
    let day: Day?
}

public struct Day: Codable {
    let condition: Condition?
    let avgTempC: Double?
    let maxWindKph: Double?
    
    enum CodingKeys: String, CodingKey {
        case condition
        case avgTempC = "avgtemp_c"
        case maxWindKph = "maxwind_kph"
    }
}

public struct Condition: Codable {
    let text: String?
    let icon: String?
}
