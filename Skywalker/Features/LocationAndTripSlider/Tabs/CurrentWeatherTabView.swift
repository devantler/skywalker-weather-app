import SwiftUI

struct CurrentWeatherTabView: View {
    @EnvironmentObject var userData: UserData
    var tag: Int
    var body: some View {
        WeatherView(deleteAction: {
            userData.deleteLocation(locationName: "current")
        }, locationName: "current").tabItem {
            Label("", systemImage: "location.circle")
        }.tag(tag)
    }
}

struct CurrentWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherTabView(tag: 0)
    }
}
