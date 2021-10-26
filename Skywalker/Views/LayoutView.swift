import SwiftUI

struct LayoutView: View {
    var body: some View {
        TabView{
            LocationView()
            ForEach(0 ..< 1) { _ in
                LocationView()
            }
            LocationView()
            ForEach(0 ..< 2) { _ in
                TripView()
            }
            TripView()
        }.tabViewStyle(.page)
    }
    
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
