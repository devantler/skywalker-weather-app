import SwiftUI

struct WeatherTabView: View {
    @EnvironmentObject var userData: UserData
    var tag: Int
    var locationName: String
    var body: some View {
        WeatherView(deleteAction: {
            userData.deleteLocation(locationName: locationName)
        },locationName: locationName)
            .tabItem {
                Label("", systemImage: "cloud")
            }.tag(tag)
    }
}

struct WeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTabView(tag: 0, locationName: "TesLocation")
    }
}
