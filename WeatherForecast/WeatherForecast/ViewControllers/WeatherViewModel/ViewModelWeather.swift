//
//  ViewModelWeather.swift
//  WeatherForecast
//
//  Created by user on 3.09.22.
//

import Foundation
import UIKit

class ViewModelWeather: UIViewController {
    var weatherStruct : Daily?
    
    var bindWeather: Bindable<Hourly> = Bindable()
    let networkModel = WeatherDecode()
    
    let networkAPI = APIManager()
//    (latitude: 34.05, longitude: -118.24, timeZone: "America Los_Angeles", daily:["temperature_2m_max","temperature_2m_min"] )
    
//    func loadDataLosAngeles(latitude: Double = 34.05,
//                            longitude: Double = -118.24,
//                            timeZone: String = "America Los_Angeles",
//                            daily:[String] = ["temperature_2m_max","temperature_2m_min"] ) {
//        NetworkService.request(router: WeatherRouter.getWeather(latitude: latitude, longitude: longitude, timeZone: timeZone, daily: daily )) { [weak bindWeather] (result: Result<Daily, Error>) in
//            switch result {
//            case .success(let daily):
//                bindWeather?.update(with: daily)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
        
//        networkModel.getWeather(url: API.losAngeles) { [weak bindWeather] daily in
//            bindWeather?.update(with: daily)
//        }
        
    
    func loadDataBerlin() {
        networkModel.getWeather(url: API.newApi) { [weak bindWeather] hourly in
            bindWeather?.update(with: hourly)
        }
    }
    
    func loadDataNewYork() {
        networkModel.getWeather(url: API.newApi) { [weak bindWeather] daily in
            bindWeather?.update(with: daily)
        }
    }
}
