import Foundation
import SwiftUI

class WeatherLineViewModel : ObservableObject {
    @Published var location: Location
    @Published var weather: Weather
    @Published var styling: WeatherLineStyling
    
    init(location: Location, weather: Weather, styling: WeatherLineStyling){
        self.location = location
        self.weather = weather
        self.styling = styling
    }
}
