import SwiftUI

struct LayoutView: View {
    var body: some View {
        TabView{
            //We need to make this view show the default add location stuff for empty locations
            LocationView()
            //We need make this for loop read in saved locations
            ForEach(0 ..< 1) { _ in
                LocationView()
            }
            //We need to make this view show the current location
            LocationView()
            //We need to make this for loop read in saved trips
            ForEach(0 ..< 2) { _ in
                TripView()
            }
            // We need to make this view show the default add trip stuff for empty locations
            TripView()
        }.tabViewStyle(.page)
    }
    
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
