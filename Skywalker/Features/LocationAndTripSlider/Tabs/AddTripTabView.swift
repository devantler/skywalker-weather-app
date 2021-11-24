import SwiftUI

struct AddTripTabView: View {
    var tag: Int
    var body: some View {
        AddTripView()
            .tabItem {
                Label("", systemImage: "plus.circle")
            }.tag(tag)
    }
}

struct AddTripTabView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripTabView(tag: 0)
    }
}
