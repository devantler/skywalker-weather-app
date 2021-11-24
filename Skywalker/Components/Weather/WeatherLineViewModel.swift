import Foundation

class WeatherLineViewModel : ObservableObject {
    @Published var location: Location
    @Published var weather: Weather
    
    init(location: Location, weather: Weather){
        self.location = location
        self.weather = weather
    }
}
