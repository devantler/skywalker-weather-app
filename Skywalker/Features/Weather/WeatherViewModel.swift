import Foundation

class WeatherViewModel : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    @Published var locationAndWeather: (Location, Weather)
    
    init(locationName: String){
        self.locationAndWeather = (Location(name: locationName), Weather(date: Date(), temperature: 22, status: WeatherStatus.Cloudy))
    }
}
