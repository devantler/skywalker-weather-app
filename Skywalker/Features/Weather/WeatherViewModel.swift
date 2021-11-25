import Foundation

class WeatherViewModel : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    @Published var locationAndWeather: (Location, Weather)
    
    init(locationName: String){
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
