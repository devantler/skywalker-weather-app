import Foundation

public class TripViewModel : ObservableObject {
    var trip: Trip = Trip()
    @Inject private var openWeatherApi: OpenWeatherApi
    
    func addLocationToTrip(location: Location){
        //Just an example method we might need in the TripViewModel
    }
}
