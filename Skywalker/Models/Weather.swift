import Foundation

struct Weather {
    var date: Date
    var temperature: Double?
    var status: WeatherStatus = WeatherStatus.None
}
