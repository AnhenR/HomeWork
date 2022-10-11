//
//  WeatherAPI.swift
//  WeatherForecast
//
//  Created by user on 8.08.22.
//

import Foundation

struct API {
    static let losAngeles = "https://api.open-meteo.com/v1/forecast?latitude=34.05&longitude=-118.24&daily=temperature_2m_max,temperature_2m_min&timezone=America%2FLos_Angeles"
    static let newYork = "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&daily=temperature_2m_max,temperature_2m_min&timezone=America%2FNew_York"
    static let berlin = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"
    
    static let newApi = "https://api.open-meteo.com/v1/forecast?latitude=51.5002&longitude=-0.1262&hourly=temperature_2m,apparent_temperature,rain,snowfall,cloudcover,windspeed_10m&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,precipitation_hours&timezone=America%2FNew_York"
}
