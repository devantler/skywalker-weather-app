import SwiftUI

struct LocationView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    
    @StateObject var weatherApi = WeatherApi()
    
    init(location: Location) {
        self.locationViewModel = .init(location: location)
    }
    
    var body: some View {
        VStack{
            CurrentWeatherView(
                locationName: locationViewModel.location.name,
                weather: locationViewModel.location.todaysWeather)
            Text("\(weatherApi.current.weather[0].main)").padding()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location(name: "Odense", todaysWeather: Weather(date: Date(), temperature: 20.21, weatherStatus: WeatherStatus.Sunny)))
    }
}
