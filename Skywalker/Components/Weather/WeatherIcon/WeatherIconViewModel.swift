import Foundation

class WeatherIconViewModel : ObservableObject {
    @Published var weatherStatus: WeatherStatus
    @Published var styling: WeatherIconStyling
    
    init(weatherStatus: WeatherStatus, styling: WeatherIconStyling){
        self.weatherStatus = weatherStatus
        self.styling = styling
    }
}
