import SwiftUI

struct TripView: View {
    var isEmpty: Bool = false
    @ObservedObject var tripViewModel: TripViewModel = TripViewModel()
    var body: some View {
        VStack{
            Text("Trip View")
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
