//
//  WeatherRepository.swift
//  WeatherTestTask
//
//  Created by Александр Иванцов on 28.05.2025.
//

import Foundation
import Moya
import RxSwift
import RxMoya

protocol WeatherRepository: AnyObject {
    func getWeather(for city: String?) -> Single<Weather>
}

final class WeatherRepositoryImpl: WeatherRepository {
    
    private let provider = MoyaProvider<WeatherAPI>()
    
    func getWeather(for city: String?) -> Single<Weather> {
        guard let city = city else { fatalError() }
        
        return provider.rx.request(WeatherAPI.getWeather(city: city))
            .filterSuccessfulStatusCodes()
            .map(Weather.self)
    }
    
}
