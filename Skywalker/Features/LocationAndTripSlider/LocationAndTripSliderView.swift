import SwiftUI
import CoreLocation

struct LocationAndTripSliderView: View {
    @StateObject var userData: UserData = UserData()
    @StateObject var viewModel: LocationAndTripSliderViewModel = LocationAndTripSliderViewModel(selectedTab: 0)
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        TabView(selection: $viewModel.tabs.selected) {
            CurrentWeatherTabView(tag: 0, locationName: locationManager.city)
             
            ForEach(Array(userData.locations.enumerated()), id: \.offset) { index, locationName in
                WeatherTabView(tag: index + 1, locationName: locationName)
            }
            
            AddLocationTabView(tag: userData.locations.count + 1)
            
            //ForEach(0 ..< userData.trips.count) { i in
            //    TripWeatherTabView(tag: userData.locations.count+i+1)
            //}
            
            //AddTripTabView(tag: userData.locations.count + userData.trips.count + 2)
        }.onAppear {
            viewModel.setupTabsAppearance()
            updateCurrentLocation()
        }
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .tabViewStyle(.page)
        .id($userData.locations.count + 1)
        .environmentObject(userData)
    }
    
    func updateCurrentLocation() {
        do {
            try locationManager.start()
        }
        catch {
            locationManager.requestAuthorization()
        }
    }
}

struct LocationAndTripSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndTripSliderView()
    }
}
