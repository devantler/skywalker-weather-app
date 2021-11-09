import Foundation
public class UserViewModel: ObservableObject {
    public var userData: UserData = UserData()
    
    init(){
        userData.locations = loadLocations()
        userData.trips = loadTrips()
    }
    
    private func loadLocations() -> [Location] {
        return [Location(name: "Odense", todaysWeather: Weather(date: Date(), temperature: 20.21, weatherStatus: WeatherStatus.Sunny)),
                Location(name: "København", todaysWeather: Weather(date: Date(), temperature: 11.94, weatherStatus: WeatherStatus.Cloudy))]
    }
    
    private func loadTrips() -> [Trip] {
        return []
    }
}
