import Foundation

class AddLocationViewModel: ObservableObject {
    @Published var location: Location = Location(name: "")
    @Published var invalidLocationName = false
    @Published var maximumLocationsAlert = false
}
