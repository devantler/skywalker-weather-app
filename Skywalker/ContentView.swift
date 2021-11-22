import SwiftUI

struct ContentView: View {
    @StateObject var userData: UserData = UserData()
    @State var selectedTab: Int = UserData().locations.count + 1
    
    var body: some View {
        let locationsCount: Int = $userData.locations.count
        let tripsCount: Int = $userData.trips.count
        TabView(selection: $selectedTab) {
            AddLocationView()
                .tabItem {
                    Label("", systemImage: "plus.circle")
                }.tag(0)
            ForEach(Array(userData.locations.enumerated()), id: \.offset) { index, locationName in
                LocationView(locationName: locationName)
                    .tabItem {
                        Label("", systemImage: "cloud")
                    }.tag(index + 1)
            }
            LocationView()
                .tabItem {
                    Label("", systemImage: "location.circle")
                }.tag(locationsCount + 1)
            ForEach(0 ..< tripsCount) { i in
                TripView()
                    .tabItem {
                        Label("", systemImage: "airplane.departure")
                    }.tag(locationsCount+i+1)
            }
            AddTripView()
                .tabItem {
                    Label("", systemImage: "plus.circle")
                }.tag(locationsCount+tripsCount+2)
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onAppear {
                setupAppearance()
            }.environmentObject(userData)
        
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
