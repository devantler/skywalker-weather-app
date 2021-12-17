import Foundation
import SwiftUI

class WeatherViewModel : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    @Published var locationAndWeather: (Location, WeatherCollection)
    var isCurrentLocation: Bool
    
    init(locationName: String, isCurrentLocation: Bool){
        self.isCurrentLocation = isCurrentLocation
        self.locationAndWeather = (Location(name: locationName), WeatherCollection(currentWeather: Weather(date: Date())))
    }
    
    func updateWeather(){
        openWeatherApi.fetchGeoLocation(city: locationAndWeather.0.name, completion: { (lat, lon) in
            self.openWeatherApi.fetchWeather(latitude: lat, longitude: lon, completion: { weather in
                let currentWeather = Weather(date: Date(), temperature: weather.current.temp, status: self.parseWeatherStatus(status: weather.current.weather.first?.main ?? ""))
                var forecast: [Weather] = []
                for dailyWeather in weather.daily {
                    forecast.append(Weather(date: Date(timeIntervalSince1970: dailyWeather.dt), temperature: dailyWeather.temp.max, status: self.parseWeatherStatus(status: dailyWeather.weather.first?.main ?? "")))
                }
                let weatherCollection = WeatherCollection(currentWeather: currentWeather, forecast: forecast)
                DispatchQueue.main.async {
                    self.locationAndWeather.1 = weatherCollection
                }
            })
        })
    }
    
    func parseWeatherStatus(status: String) -> WeatherStatus {
        var weatherStatus: WeatherStatus
        switch status {
        case "Thunderstorm":
            weatherStatus = WeatherStatus.Thunderstorm
        case "Drizzle":
            weatherStatus = WeatherStatus.Drizzle
        case "Rain":
            weatherStatus = WeatherStatus.Rain
        case "Snow":
            weatherStatus = WeatherStatus.Snow
        case "Mist":
            weatherStatus = WeatherStatus.Mist
        case "Smoke":
            weatherStatus = WeatherStatus.Smoke
        case "Haze":
            weatherStatus = WeatherStatus.Haze
        case "Sand":
            weatherStatus = WeatherStatus.Sand
        case "Dust":
            weatherStatus = WeatherStatus.Dust
        case "Fog":
            weatherStatus = WeatherStatus.Fog
        case "Ash":
            weatherStatus = WeatherStatus.Ash
        case "Squall":
            weatherStatus = WeatherStatus.Squall
        case "Tornado":
            weatherStatus = WeatherStatus.Tornado
        case "Clear":
            weatherStatus = WeatherStatus.Clear
        case "Clouds":
            weatherStatus = WeatherStatus.Clouds
        default:
            weatherStatus = WeatherStatus.None
        }
        return weatherStatus
    }
}
