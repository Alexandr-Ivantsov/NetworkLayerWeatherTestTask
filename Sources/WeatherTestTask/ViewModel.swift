//
//  ViewModel.swift
//  WeatherTestTask
//
//  Created by Александр Иванцов on 01.06.2025.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa
import Alert

public protocol ViewModel: AnyObject {
    
    var showAlert: Single<AlerDataProtocol> { get }
    var updateTableView: Single<Void> { get }
    var weather: Single<Weather> { get }
    
    func fetchWeather(for city: String)
    
}

final class ViewModelImpl: ViewModel {
    
    var showAlert: Single<AlerDataProtocol> {
        _showAlert.asSingle()
    }
    
    var updateTableView: Single<Void> {
        _updateTableView.asSingle()
    }
    
    var weather: Single<Weather> {
        _weather.asSingle()
    }
    
    private let _showAlert = PublishRelay<AlerDataProtocol>()
    private let _updateTableView = PublishRelay<Void>()
    private let _weather = PublishRelay<Weather>()
    
    private let bag = DisposeBag()
    
    private let weatherUseCase: WeatherUseCase!
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func fetchWeather(for city: String) {
        guard city.unicodeScalars.contains(where: { CharacterSet.letters.contains($0) }) else {
            _showAlert.accept(
                AlertData(
                    title: "Ошибка",
                    message: "Введён некорректный город",
                    actionTitle: "Ok",
                    actionHandler: nil
                )
            )
            
            return
        }
        
        weatherUseCase.getWeather(for: city)
            .subscribe(onSuccess: { [weak self] weather in
                guard let self else { return }
                
                self._weather.accept(weather)
                self._updateTableView.accept(())
            }, onFailure: { [weak self] error in
                self?._showAlert.accept(
                    AlertData(
                        title: "Ошибка",
                        message: error.localizedDescription,
                        actionTitle: "Ok",
                        actionHandler: nil
                    )
                )
            })
            .disposed(by: bag)
    }
    
}
