import SwiftUI

struct WeatherIcon: View {
    @ObservedObject var viewModel: WeatherIconViewModel
    
    init(weatherStatus: WeatherStatus, styling: WeatherIconStyling = WeatherIconStyling()){
        viewModel = .init(weatherStatus: weatherStatus, styling: styling)
    }
    
    var body: some View {
        switch viewModel.weatherStatus {
        case .Thunderstorm:
            Image(systemName: "cloud.bolt.fill").foregroundColor(.white).font(.system(size: viewModel.styling.size))
        case .Drizzle:
            Image(systemName: "cloud.drizzle.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Rain:
            Image(systemName: "cloud.rain.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Snow:
            Image(systemName: "cloud.snow.fill").foregroundColor(.white).font(.system(size: viewModel.styling.size))
        case .Mist:
            Image(systemName: "cloud.fog.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Smoke:
            Image(systemName: "cloud.smoke.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Haze:
            Image(systemName: "sun.haze.fill").foregroundColor(.yellow).font(.system(size: viewModel.styling.size))
        case .Sand:
            Image(systemName: "sun.dust.fill").foregroundColor(.yellow).font(.system(size: viewModel.styling.size))
        case .Dust:
            Image(systemName: "sun.dust.fill").foregroundColor(.yellow).font(.system(size: viewModel.styling.size))
        case .Fog:
            Image(systemName: "cloud.fog.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Ash:
            Image(systemName: "cloud.fog.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Squall:
            Image(systemName: "cloud.fog.fill").foregroundColor(Color(UIColor.lightGray)).font(.system(size: viewModel.styling.size))
        case .Tornado:
            Image(systemName: "tornado").foregroundColor(.gray).font(.system(size: viewModel.styling.size))
        case .Clear:
            Image(systemName: "sun.max.fill").foregroundColor(.yellow).font(.system(size: viewModel.styling.size))
        case .Clouds:
            Image(systemName: "cloud.fill").foregroundColor(.white).font(.system(size: viewModel.styling.size))
        case .None:
            EmptyView()
        }
    }
    
    struct WeatherIcon_Previews: PreviewProvider {
        static var previews: some View {
            WeatherIcon(weatherStatus: WeatherStatus.Clear)
        }
    }
}
