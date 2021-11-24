import SwiftUI

struct LocationAndTripSliderView: View {
    @StateObject var userData: UserData = UserData()
    @StateObject var viewModel: LocationAndTripSliderViewModel = LocationAndTripSliderViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.tabs.selected) {
            AddLocationTabView(tag: 0)
            
            ForEach(Array(userData.locations.reversed().enumerated()), id: \.offset) { index, locationName in
                WeatherTabView(tag: index + 1, locationName: locationName)
            }
            
            CurrentWeatherTabView(tag: userData.locations.count + 1)
            
            ForEach(0 ..< userData.trips.count) { i in
                TripWeatherTabView(tag: userData.locations.count+i+1)
            }
            
            AddTripTabView(tag: userData.locations.count + userData.trips.count + 2)
        }
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .tabViewStyle(.page)
        .onAppear {
            viewModel.setupTabsAppearance()
            viewModel.tabs.selected = userData.locations.count + 1
            viewModel.tabs.count = userData.locations.count + userData.trips.count + 2
        }
        .id(viewModel.tabs.count)
        .environmentObject(userData)
    }
}

struct LocationAndTripSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndTripSliderView()
    }
}
