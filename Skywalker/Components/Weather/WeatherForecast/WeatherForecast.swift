import SwiftUI

struct WeatherForecast: View {
    @ObservedObject var viewModel: WeatherForecastViewModel
    let dateFormatter = DateFormatter()
    
    init(location: Location, weathers: [Weather]) {
        self.viewModel = .init(location: location, weathers: weathers)
        dateFormatter.dateFormat = "EEEE"
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0 ..< viewModel.weathers.count, id: \.self) { i in
                    HStack{
                        Text(Calendar.current.isDate(Date.now, inSameDayAs: viewModel.weathers[i].date	) ? "Today" : dateFormatter.string(from: viewModel.weathers[i].date))
                        WeatherIcon(weatherStatus: viewModel.weathers[i].status)
                        Text((viewModel.weathers[i].temperature?.description ?? "") + "°C")
                        Spacer()
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .leading).border(Color.gray)
                }
            }
        }
    }
}

struct WeatherForecast_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecast(location: Location(name: "Kolding"), weathers: [Weather(date: Date(), temperature: -2, status: WeatherStatus.Clouds)])
    }
}
