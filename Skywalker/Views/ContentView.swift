import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int
    private var locationsLen: Int //temp
    private var tripsLen: Int //temp
    init(){
        locationsLen = 1
        tripsLen = 2
        selectedTab = locationsLen+1
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LocationView(isEmpty: true)
                .tabItem {
                    Label("", systemImage: "person.fill")
                }.tag(0)
            ForEach(0 ..< locationsLen) { index in
                LocationView().tag(1+index)
            }
            LocationView().tag(1+locationsLen)
            ForEach(0 ..< tripsLen) { index in
                TripView().tag(2+locationsLen+index)
            }
            TripView(isEmpty: true).tag(2+locationsLen+tripsLen)
                .tabItem {
                    Label("", systemImage: "globe.europe.africa")
                }.tag(0)
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
