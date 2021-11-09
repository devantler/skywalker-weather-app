import SwiftUI

struct AddTripView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        AddButtonView(label: "Add trip")
    }
}

struct AddTripView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripView(userViewModel: .init())
    }
}
