import Foundation

public class WeatherViewModel : ObservableObject {
    @Published var locationName: String
    @Published var weather: Weather
    
    init(locationName: String, weather: Weather){
        self.locationName = locationName
        self.weather = weather
    }
}
