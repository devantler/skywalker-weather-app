import SwiftUI

struct WeatherIconView: View {
    public var size: CGFloat = 30
    public var weatherStatus: WeatherStatus
    
    var body: some View {
        switch weatherStatus {
        case WeatherStatus.Sunny:
            Image(systemName: "sun.max.fill").foregroundColor(.yellow).font(.system(size: size))
        case WeatherStatus.Cloudy:
            Image(systemName: "cloud.fill").foregroundColor(.gray).font(.system(size: size))
        }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView(weatherStatus: WeatherStatus.Cloudy)
    }
}
