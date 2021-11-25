import Foundation

class AddLocationViewModel: ObservableObject {
    @Published var location: Location = Location(name: "")
}
