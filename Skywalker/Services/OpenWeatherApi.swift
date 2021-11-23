//
//  WeatherApi.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 02/11/2021.
//

import Foundation

struct WeatherData: Codable {
    var current: WeatherDataCurrent
    var daily: [WeatherDataDaily] = [WeatherDataDaily()]
}

struct WeatherDataCurrent: Codable {
    var temp: Double = 0.0
    var weather: [SingleWeather] = [SingleWeather()]
}

struct SingleWeather: Codable {
    var main: String = ""
    var description: String = ""
}

struct WeatherDataDaily: Codable {
    var temp: WeatherDataDailyTemp = WeatherDataDailyTemp()
    var weather: [SingleWeather] = [SingleWeather()]
}

struct WeatherDataDailyTemp: Codable {
    var day: Double = 0.0
}


struct GeoLocationData: Codable {
    var lon: Double = 0.0
    var lat: Double = 0.0
}

struct FailableDecodable<Base : Decodable> : Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}

class OpenWeatherApi: ObservableObject{
    let session = URLSession(configuration: .default)
    var currentTask: URLSessionDataTask? = nil
    let jsonDecoder = JSONDecoder()
    
    //the only two important objects
    @Published var current: WeatherDataCurrent = WeatherDataCurrent()
    @Published var daily: [WeatherDataDaily] = [WeatherDataDaily()]
    
    // these dont have to be published
    @Published var lat: Double = 0.0
    @Published var lon: Double = 0.0
    @Published var downloadingWeatherData: Bool = false
    @Published var downloadingGeoLocationData: Bool = false
    
    
    init() {
        getGeoLocationData(city: "Odense")
    }
    
    func getGeoLocationData(city: String){
        let openWeatherApiURL = "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=1&appid=7b22a3a1174e9275a9916a73062eed8e"
        var request = URLRequest(url: URL(string: openWeatherApiURL)!)
        request.httpMethod = "GET"
        currentTask?.cancel()
        downloadingGeoLocationData = true
        currentTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            print("received response")
            //sleep(2)
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let geoLocationData = try? self?.jsonDecoder.decode([FailableDecodable<GeoLocationData>].self, from: data) {
                if let geoData = geoLocationData[0].base{
                    DispatchQueue.main.async {
                        self?.getWeatherData(latitude: geoData.lat, longitude: geoData.lon)
                    }
                }
            } else {
                print("")
            }
            DispatchQueue.main.async {
                self?.downloadingGeoLocationData = false
            }
        })
        currentTask?.resume()
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
                    //self?.lat = weatherData.lat
                    //self?.lon = weatherData.lon
                    //self?.timezone = weatherData.timezone
                    //self?.timezone_offset = weatherData.timezone_offset
                    self?.current = weatherData.current
                    self?.daily = weatherData.daily
                    //print(weatherData.daily)
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
