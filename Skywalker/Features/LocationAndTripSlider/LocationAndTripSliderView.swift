//
//  LocationAndTripSliderView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct LocationAndTripSliderView: View {
    @StateObject var userData: UserData = UserData()
    @State var selectedTab: Int = UserData().locations.count + 1
    
    var body: some View {
        let locationsCount: Int = $userData.locations.count
        let tripsCount: Int = $userData.trips.count
        let totalTabCount: Int = locationsCount + tripsCount + 2
        TabView(selection: $selectedTab) {
            AddLocationTabView(tag: 0)
            
            ForEach(Array(userData.locations.reversed().enumerated()), id: \.offset) { index, locationName in
                LocationTabView(tag: index + 1, locationName: locationName)
            }
            
            CurrentLocationTabView(tag: locationsCount + 1)
            
            ForEach(0 ..< tripsCount) { i in
                TripTabView(tag: locationsCount+i+1)
            }
            
            AddTripTabView(tag: locationsCount+tripsCount+2)
        }.id(totalTabCount)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onAppear {
                setupAppearance()
            }.environmentObject(userData)
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
    }
}

struct LocationAndTripSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndTripSliderView()
    }
}
