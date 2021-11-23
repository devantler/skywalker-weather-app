import SwiftUI

struct LocationTabView: View {
    var tag: Int
    var locationName: String
    var body: some View {
        LocationView(locationName: locationName)
            .tabItem {
                Label("", systemImage: "cloud")
            }.tag(tag)
    }
}

struct LocationTabView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTabView(tag: 0, locationName: "TesLocation")
    }
}
