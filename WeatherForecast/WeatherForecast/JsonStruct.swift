//
//  JsonStruct.swift
//  WeatherForecast
//
//  Created by user on 5.08.22.
//

import Foundation
import UIKit

struct Weather: Decodable {
    let latitude: Double
    let longitude: Double
    let generationtimeMs: Double
    let utcOffsetSeconds: Int
    let timezone: String
    let timezoneAbbreviation: String
    let elevation: Double
    let dailyUnits: DailyUnits
    let daily: Daily
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, elevation, timezone, daily
        case generationtimeMs = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezoneAbbreviation = "timezone_abbreviation"
        case dailyUnits = "daily_units"
    }
}

struct DailyUnits: Decodable {
    let time: String
    let temperature2mMax: String
    let temperature2mMin: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2mMax = "temperature_2m_max"
        case temperature2mMin = "temperature_2m_min"
    }
}

struct Daily: Decodable {
    let time: [String]
    let temperature2mMax: [Float]
    let temperature2mMin: [Float]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2mMax = "temperature_2m_max"
        case temperature2mMin = "temperature_2m_min"
    }
}

enum UserDefaultsKeys : String {
    case time = "time"
    case tempMax = "tempMax"
    case tempMin = "tempMin"
}

class WeatherDecode: UIViewController {
    
    func getWeather(completion: @escaping ((Daily) -> Void)) {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=34.05&longitude=-118.24&daily=temperature_2m_max,temperature_2m_min&timezone=America%2FLos_Angeles")!
        var request = URLRequest(url: url)
        request.setValue("apllication/json", forHTTPHeaderField: "Content-type")
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    completion(weather.daily)
                } catch {
                    print(error)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension UserDefaults  {
    func set(_ value: Any?, forKey key: UserDefaultsKeys) {
        set(value, forKey: key.rawValue)
    }
    
    func value(forKey key: UserDefaultsKeys) -> Any? {
        return value(forKey: key.rawValue)
    }
}
