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

protocol NetworkRouterProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: String { get }
    var parameters: [URLQueryItem] { get }
}

class NetworkService {
    class func request<T: Decodable>(router: NetworkRouterProtocol, completion: @escaping (Result<T, Error>)-> Void) {
        
        var comonents = URLComponents()
        comonents.scheme = router.scheme
        comonents.host = router.host
        comonents.path = router.path
        comonents.queryItems = router.parameters
        
        let session = URLSession(configuration: .default)
        guard let url = comonents.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            guard response != nil else {
                print("no response")
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}

enum WeatherRouter: NetworkRouterProtocol {
    
    case getWeather(latitude: Double, longitude: Double)
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.open-meteo.com"
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "/v1/forecast"
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getWeather(let latitude, let longitude):
            return [
                URLQueryItem(name: "latitude", value: "\(latitude)"),
                URLQueryItem(name: "longitude", value: "\(longitude)"),
                URLQueryItem(name: "timezone", value: "America Los_Angeles"),
                URLQueryItem(name: "daily", value: "temperature_2m_max,temperature_2m_min")
            ]
        }
    }
    
    
}

class APIManager {
    var components = URLComponents()
    func gatWeather(url: String, completion:  @escaping ((Daily) -> Void )) {
        components.scheme = "https"
        components.host = "api.open-meteo.com/v1/forecast"
        
        let latitudeQuery = URLQueryItem(name: "latitude", value: "34.05")
        let longitudeQuery = URLQueryItem(name: "longitude", value: "-118.24")
        let dailyQUery = URLQueryItem(name: "daily", value: "temperature_2m_max,temperature_2m_min")
        let timeZone = URLQueryItem(name: "timezone", value: "America Los_Angeles")
        
        components.queryItems = [latitudeQuery, longitudeQuery, dailyQUery, timeZone]
        
        guard let url = components.url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
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

class WeatherDecode {
    
    func getWeather(url: String, completion: @escaping ((Daily) -> Void)) {
        guard let url = URL(string: url) else {return}
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

