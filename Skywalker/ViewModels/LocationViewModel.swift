import Foundation

public class LocationViewModel : ObservableObject {
    @Published var location: Location
    
    init(location: Location){
        self.location = location
    }
}
