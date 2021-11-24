import Foundation

class TripViewModel : ObservableObject {
    var trip: Trip = Trip()
    @Inject private var openWeatherApi: OpenWeatherApi
    
    func addWeatherToTrip(location: Weather){
        //Just an example method we might need in the TripViewModel
    }
}
