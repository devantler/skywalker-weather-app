import Foundation
class UserData : ObservableObject {
    @Inject var openWeatherApi: OpenWeatherApi
    private var defaults: UserDefaults = UserDefaults.standard
    @Published var currentLocation: String = ""
    @Published var locations: [String] = []
    @Published var trips: [Trip] = []
    @Published var saveLocationError = SaveLocationError.unset;
    
    init(){
        loadLocations()
        self.trips = loadTrips()
    }
    
    func saveLocation(locationName: String) {
        saveLocationError = .unset
        openWeatherApi.fetchGeoLocation(city: locationName, completion:  { (lat, lon) in
            guard self.locations.count < 5 else {
                self.saveLocationError = SaveLocationError.maxLocationsReached
                return
            }
            guard lat != 0 && lon != 0 else {
                self.saveLocationError = SaveLocationError.invalidLocationName
                return
            }
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
