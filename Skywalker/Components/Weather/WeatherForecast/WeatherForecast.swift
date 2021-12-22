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
                    if(viewModel.weathers[i].date >= Date.now){
                        HStack{
                            let isToday = Calendar.current.isDateInToday(viewModel.weathers[i].date)
                            let isTomorrow = Calendar.current.isDateInTomorrow(viewModel.weathers[i].date)
                            if(isToday){
                                Text("Today")
                            } else if(isTomorrow) {
                                Text("Tomorrow")
                            } else {
                                Text(dateFormatter.string(from: viewModel.weathers[i].date))
                            }
                            Spacer()
                            WeatherIcon(weatherStatus: viewModel.weathers[i].status)
                            Text((viewModel.weathers[i].temperature?.description ?? "") + "°C")
                        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .leading)
                    }
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
