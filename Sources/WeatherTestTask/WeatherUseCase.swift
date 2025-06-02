//
//  WeatherUseCase.swift
//  WeatherTestTask
//
//  Created by Александр Иванцов on 31.05.2025.
//

import Foundation
import RxSwift

protocol WeatherUseCase: AnyObject {
    func getWeather(for city: String) -> Single<Weather>
}

final class WeatherUseCaseImpl: WeatherUseCase {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func getWeather(for city: String) -> Single<Weather> {
        return repository.getWeather(for: city)
    }
    
}
