import SwiftUI

struct CurrentWeatherTabView: View {
    @EnvironmentObject var userData: UserData
    var tag: Int
    var locationName: String?
    var body: some View {
        WeatherView(deleteAction: {},locationName: locationName ?? "", isCurrentLocation: true)
            .tabItem {
                Label("", systemImage: "location.circle")
            }.tag(tag)
    }
}

struct CurrentWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherTabView(tag: 0, locationName: "current")
    }
}
