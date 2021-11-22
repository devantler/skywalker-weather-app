import Foundation

public class LocationViewModel : ObservableObject {
    @Inject var weatherApi: WeatherApi
    @Published var location: Location
    
    init(locationName: String){
        self.location = Location(name: locationName, todaysWeather: Weather(date: Date(), temperature: 22, weatherStatus: WeatherStatus.Cloudy))
    }
}
