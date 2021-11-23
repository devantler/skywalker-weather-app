import SwiftUI

struct AddLocationView: View {
    @EnvironmentObject var userData: UserData
    @State var locationName: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            TextField("Location name", text: $locationName).multilineTextAlignment(.center).textFieldStyle(.roundedBorder)
            Button {
                showAlert = true
                userData.saveLocation(locationName: locationName)
                locationName = ""
            } label: {
                VStack{
                    Image(systemName: "plus")
                        .font(Font.system(.largeTitle))
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .clipShape(Circle())
                    Text("Add Location")
                }
            }
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
