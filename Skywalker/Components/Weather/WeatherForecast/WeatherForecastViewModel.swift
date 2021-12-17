import Foundation
import SwiftUI

class WeatherForecastViewModel : ObservableObject {
    @Published var location: Location
    @Published var weathers: [Weather]
    
    init(location: Location, weathers: [Weather]){
        self.location = location
        self.weathers = weathers
    }
}
