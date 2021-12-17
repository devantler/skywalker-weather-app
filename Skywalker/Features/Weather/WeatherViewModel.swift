import Foundation
import SwiftUI

class WeatherViewModel : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    @Published var locationAndWeather: (Location, Weather)
    var isCurrentLocation: Bool
    
    init(locationName: String, isCurrentLocation: Bool){
        self.isCurrentLocation = isCurrentLocation
        self.locationAndWeather = (Location(name: locationName), Weather())
    }
    
    func updateWeather(){
        openWeatherApi.fetchGeoLocation(city: locationAndWeather.0.name, completion: { (lat, lon) in
            self.openWeatherApi.fetchWeather(latitude: lat, longitude: lon, completion: { weather in
                print(weather)
            })
        })
    }
}
