import SwiftUI

struct AddLocationView: View {
    @ObservedObject var userViewModel: UserViewModel
        
    var body: some View {
        AddButtonView(label: "Add location")
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(userViewModel: .init())
    }
}
