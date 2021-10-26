//
//  ContentView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    let minDragTranslationForSwipe: CGFloat = 50
    let numTabs = 3 //can we get this value from the views
    var body: some View {
        TabView(selection: $selectedTab){
            NavigationView{
                LocationView()
            }.tabItem {
                Image(systemName: "circle")
            }.tag(0)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            NavigationView{
                WeatherView()
            }.tabItem {
                Image(systemName: "circle")
            }.tag(1)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            NavigationView{
                TripView()
            }.tabItem {
                Image(systemName: "circle")
            }
            .tag(2)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
        }
    }
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs-1 {
            selectedTab += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
