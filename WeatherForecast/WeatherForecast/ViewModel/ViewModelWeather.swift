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
    
    func loadDataLosAngeles() {
        networkModel.getWeather(url: API.losAngeles) { [weak bindWeather] daily in
            bindWeather?.update(with: daily)
        }
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
