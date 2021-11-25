import Foundation
class UserData : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    private var defaults: UserDefaults = UserDefaults.standard
    @Published var locations: [String] = []
    @Published var trips: [Trip] = []
    
    init(){
        loadLocations()
        self.trips = loadTrips()
    }
    
    func saveLocation(locationName: String) {
        openWeatherApi.fetchGeoLocation(city: locationName, completion:  { (lat, lon) in
            self.locations.append(locationName)
            self.defaults.set(self.locations, forKey: "locations")
        })
    }
    
    func deleteLocation(locationName: String) {
        for (index, locName) in self.locations.enumerated() {
            if locName == locationName {
                self.locations.remove(at: index)
                break
            }
        }
        defaults.set(self.locations, forKey: "locations")
    }
    
    private func loadLocations() {
        self.locations = defaults.object(forKey: "locations") as? [String] ?? [String]()
    }
    
    private func loadTrips() -> [Trip] {
        return []
    }
}
