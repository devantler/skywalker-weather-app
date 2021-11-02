import Foundation

public class LocationViewModel : ObservableObject {
    @Inject private var weatherApi: WeatherApi
    
    public func addLocationToTrip(location: Location){
        //Just an example method we might need in the TripViewModel
    }
}
