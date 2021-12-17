import SwiftUI

struct WeatherForecast: View {
    @ObservedObject var viewModel: WeatherForecastViewModel
    let dateFormatter = DateFormatter()
    
    init(location: Location, weathers: [Weather]) {
        self.viewModel = .init(location: location, weathers: weathers)
        dateFormatter.dateFormat = "EEEE"
    }
    
    var body: some View {
        VStack{
            ForEach(0 ..< viewModel.weathers.count, id: \.self) { i in
                HStack{
                    Text(dateFormatter.string(from: viewModel.weathers[i].date))
                    WeatherIcon(weatherStatus: viewModel.weathers[i].status)
                    Text((viewModel.weathers[i].temperature?.description ?? "") + "°C")
                    Spacer()
                }.border(Color.gray)
            }
        }
    }
}

struct WeatherForecast_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecast(location: Location(name: "Kolding"), weathers: [Weather(date: Date(), temperature: -2, status: WeatherStatus.Snow)])
    }
}
