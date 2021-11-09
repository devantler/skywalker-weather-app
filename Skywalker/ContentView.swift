import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    @State public var selectedTab: Int
    private var centerTab: Int
    
    init(){
        self.centerTab = 0
        self.selectedTab = centerTab
    }
    var body: some View {
        let locationsCount: Int = userViewModel.userData.locations.count
        let tripsCount: Int = userViewModel.userData.trips.count
        TabView(selection: $selectedTab) {
            AddLocationView(userViewModel: userViewModel)
                .tabItem {
                    Label("", systemImage: "plus.circle")
                }.tag(centerTab-locationsCount-1)
            ForEach(0 ..< locationsCount) { i in
                LocationView(location: userViewModel.userData.locations[i])
                    .tabItem {
                        Label("", systemImage: "cloud")
                    }.tag(centerTab-i-1)
            }
            LocationView(location: .init(name: "Odense", todaysWeather: .init(date: Date(), temperature: 22.2, weatherStatus: WeatherStatus.Sunny)))
                .tabItem {
                    Label("", systemImage: "location.circle")
                }.tag(centerTab)
            ForEach(0 ..< tripsCount) { i in
                TripView()
                    .tabItem {
                        Label("", systemImage: "airplane.departure")
                    }.tag(centerTab+i+1)
            }
            AddTripView(userViewModel: userViewModel)
                .tabItem {
                    Label("", systemImage: "plus.circle")
                }.tag(centerTab+tripsCount+1)
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onAppear {
                setupAppearance()
            }
        
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
