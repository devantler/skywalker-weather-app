import SwiftUI

struct AddLocationTabView: View {
    var tag: Int
    var body: some View {
        AddLocationView().tabItem {
            Label("", systemImage: "plus.circle")
        }.tag(tag)
    }
}

struct AddLocationTabView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationTabView(tag: 0)
    }
}
