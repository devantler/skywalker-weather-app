import SwiftUI

struct WeatherIcon: View {
    var size: CGFloat = 30
    var weatherStatus: WeatherStatus
    
    var body: some View {
        switch weatherStatus {
        case WeatherStatus.Sunny:
            Image(systemName: "sun.max.fill").foregroundColor(.yellow).font(.system(size: size))
        case WeatherStatus.Cloudy:
            Image(systemName: "cloud.fill").foregroundColor(.gray).font(.system(size: size))
        }
    }
}

struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIcon(weatherStatus: WeatherStatus.Cloudy)
    }
}
