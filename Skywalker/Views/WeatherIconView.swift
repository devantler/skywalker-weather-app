import SwiftUI

struct WeatherIconView: View {
    public var weatherStatus: WeatherStatus
    var body: some View {
        switch weatherStatus{
        case WeatherStatus.Sunny:
            Image(systemName: "sun.max.fill").foregroundColor(.yellow).font(.system(size: 30))
        case WeatherStatus.Cloudy:
            Image(systemName: "cloud.fill").foregroundColor(.gray).font(.system(size: 30))
        default:
            Text("no symbol found")
        }
        
    }
}

struct WeatherSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSymbolView(weatherStatus: WeatherStatus.Cloudy)
    }
}
