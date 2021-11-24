import SwiftUI

struct TripWeatherTabView: View {
    var tag: Int
    var body: some View {
        TripView()
            .tabItem {
                Label("", systemImage: "airplane.departure")
            }.tag(tag)
    }
}

struct TripWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        TripWeatherTabView(tag: 0)
    }
}
