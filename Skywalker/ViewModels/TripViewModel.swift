import Foundation

public class TripViewModel : ObservableObject {
    public var trip: Trip = Trip()
    
    public func addLocationToTrip(location: Location){
        @Inject private var WeatherApi
        //Just an example method we might need in the TripViewModel
    }
}
