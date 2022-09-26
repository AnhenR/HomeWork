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
    
    var bindWeather: Bindable<Daily> = Bindable()
    let networkModel = WeatherDecode()
    
    let networkAPI = APIManager()
    
    func loadDataLosAngeles() {
        NetworkService.request(router: WeatherRouter.getWeather(latitude: 34.05, longitude: -118.24, timeZone: "America Los_Angeles", daily:["temperature_2m_max","temperature_2m_min"] )) { (result: Result<Daily, Error>) in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
        
//        networkModel.getWeather(url: API.losAngeles) { [weak bindWeather] daily in
//            bindWeather?.update(with: daily)
//        }
        
        
    }
    
    func loadDataBerlin() {
        networkModel.getWeather(url: API.berlin) { [weak bindWeather] daily in
            bindWeather?.update(with: daily)
        }
    }
    
    func loadDataNewYork() {
        networkModel.getWeather(url: API.newYork) { [weak bindWeather] daily in
            bindWeather?.update(with: daily)
        }
    }
}
