import SwiftUI

struct LocationView: View {
    @ObservedObject var locationViewModel: LocationViewModel
        
    init(location: Location) {
        self.locationViewModel = .init(location: location)
    }
    
    var body: some View {
        VStack{
            CurrentWeatherView(
                locationName: locationViewModel.location.name,
                date: locationViewModel.location.todaysWeather.date,
                weatherStatus: locationViewModel.location.todaysWeather.weatherStatus,
                temperature: locationViewModel.location.todaysWeather.temperature)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location(name: "Odense", todaysWeather: Weather(date: Date(), temperature: 20.21, weatherStatus: WeatherStatus.Sunny)))
    }
}
