import SwiftUI

struct LocationView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var locationViewModel: LocationViewModel
    
    init(locationName: String = "current") {
        self.locationViewModel = .init(locationName: locationName)
    }
    
    var body: some View {
        VStack{
            Button {
                userData.deleteLocation(locationName: locationViewModel.location.name)
            } label: {
                VStack{
                    Image(systemName: "minus")
                        .font(Font.system(.largeTitle))
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .clipShape(Circle())
                    Text("Delete Location")
                }
            }
            CurrentWeatherView(
                locationName: locationViewModel.location.name,
                weather: locationViewModel.location.todaysWeather)
            Text("\(locationViewModel.weatherApi.current.weather[0].main)").padding()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(locationName: "Odense")
    }
}
