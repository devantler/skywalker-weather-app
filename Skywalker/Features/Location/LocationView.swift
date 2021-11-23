import SwiftUI

struct LocationView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var locationViewModel: LocationViewModel
    
    init(locationName: String = "current") {
        self.locationViewModel = .init(locationName: locationName)
    }
    
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .top){
                if(locationViewModel.location.name != "current"){
                    HStack(){
                        Spacer()
                        Button {
                            userData.deleteLocation(locationName: locationViewModel.location.name)
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(Font.system(.largeTitle))
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.red)
                                .padding()
                        }
                    }
                }
                VStack{
                    CurrentWeatherView(
                        locationName: locationViewModel.location.name,
                        weather: locationViewModel.location.todaysWeather).frame(height: 200)
                    WeatherForecastView()
                }
            }
            Spacer()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(locationName: "Odense")
    }
}
