import SwiftUI

struct WeatherIcon: View {
    @ObservedObject var viewModel: WeatherIconViewModel
    
    init(weatherStatus: WeatherStatus, styling: WeatherIconStyling = WeatherIconStyling()){
        viewModel = .init(weatherStatus: weatherStatus, styling: styling)
    }
    
    var body: some View {
        switch viewModel.weatherStatus {
        case WeatherStatus.Sunny:
            Image(systemName: "sun.max.fill").foregroundColor(.yellow).font(.system(size: viewModel.styling.size))
        case WeatherStatus.Cloudy:
            Image(systemName: "cloud.fill").foregroundColor(.gray).font(.system(size: viewModel.styling.size))
        }
    }
}

struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIcon(weatherStatus: WeatherStatus.Sunny)
    }
}
