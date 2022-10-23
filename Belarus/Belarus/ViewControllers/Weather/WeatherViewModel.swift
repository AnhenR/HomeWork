//
//  WeatherViewModel.swift
//  Belarus
//
//  Created by user on 19.10.22.
//

import Foundation
import UIKit

typealias VoidHandler = () -> Void

class WeatherViewModel: UIViewController {
    
    var bindWeather: Bindable<Hourly> = Bindable()
    let activityIndicatorVisability: Bindable<Bool> = Bindable()
    
    func loadWeather(for latitude: Double, and longitude: Double) async {
        activityIndicatorVisability.update(with: false)
        do {
            let weather: Weather = try await NetworkActor.request(router: WeatherRouter.getWeather(latitude: latitude, longitude: longitude))
            if let hourly = weather.hourly {
                bindWeather.update(with: hourly)
            }
            activityIndicatorVisability.update(with: true)
        } catch {
            activityIndicatorVisability.update(with: true)
            print(error.localizedDescription)
        }
    }
    
}
