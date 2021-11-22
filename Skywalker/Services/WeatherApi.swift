//
//  WeatherApi.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 02/11/2021.
//

import Foundation

struct WeatherData: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezone_offset: Int
    var current: WeatherDataCurrent
    //var daily: WeatherDataDaily
}

struct WeatherDataCurrent: Codable {
    var temp: Double = 0.0
    var weather: [SingleWeather] = [SingleWeather()]
}

struct SingleWeather: Codable {
    var main: String = ""
}

struct WeatherDataDaily: Codable {
    var temp: Double = 0.0
}


class WeatherApi: ObservableObject{
    let session = URLSession(configuration: .default)
    var currentTask: URLSessionDataTask? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var lat: Double = 0.0
    @Published var lon: Double = 0.0
    @Published var timezone: String = ""
    @Published var timezone_offset: Int = 0
    @Published var current: WeatherDataCurrent = WeatherDataCurrent()
    //@Published var daily: WeatherDataDaily = WeatherDataDaily()
    @Published var downloadingWeatherData: Bool = false
    
    
    init() {
        getWeatherData(latitude: 55.403756, longitude: 10.40237)
    }
    
    func getWeatherData(latitude: Double, longitude: Double){
        let openWeatherApiURL = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,alerts0&appid=7b22a3a1174e9275a9916a73062eed8e"
        var request = URLRequest(url: URL(string: openWeatherApiURL)!)
        request.httpMethod = "GET"
        currentTask?.cancel()
        downloadingWeatherData = true
        currentTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            print("received response")
            //sleep(2)
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let weatherData = try? self?.jsonDecoder.decode(WeatherData.self, from: data) {
                print(weatherData)
                DispatchQueue.main.async {
                    self?.lat = weatherData.lat
                    self?.lon = weatherData.lon
                    self?.timezone = weatherData.timezone
                    self?.timezone_offset = weatherData.timezone_offset
                    self?.current = weatherData.current
                    //self?.daily = weatherData.daily
                }
            } else {
                print("Something went wrong. Try again.")
            }
            DispatchQueue.main.async {
                self?.downloadingWeatherData = false
            }
        })
        currentTask?.resume()
    }
}

