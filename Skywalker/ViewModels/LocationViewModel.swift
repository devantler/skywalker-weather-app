import Foundation

public class LocationViewModel : ObservableObject {
    @Inject var weatherApi: WeatherApi
    @Published var location: Location
    
    init(location: Location){
        self.location = location
    }
}
