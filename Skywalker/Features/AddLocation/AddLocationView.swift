import SwiftUI

struct AddLocationView: View {
    @EnvironmentObject var userData: UserData
    @StateObject var viewModel: AddLocationViewModel = AddLocationViewModel()
    
    
    var body: some View {
        VStack{
            TextField("Location name", text: $viewModel.location.name).textFieldStyle(RoundedBorderTextFieldStyle()).overlay(viewModel.invalidLocationName ? RoundedRectangle(cornerRadius: 1).stroke(Color.red, lineWidth: 1) : nil)
                .padding(20)
            if(viewModel.invalidLocationName) {
                Text("Location name is not valid")
                    .font(.callout)
                    .foregroundColor(Color.red)
            }
            RoundButton(action: {
                switch userData.saveLocation(locationName: viewModel.location.name) {
                case SaveLocationError.invalidLocationName:
                    viewModel.invalidLocationName = true
                case SaveLocationError.maxLocationsReached:
                    viewModel.maximumLocationsAlert = true
                case .unset:
                    break
                }
                viewModel.location.name = ""
            }, iconSystemName: "plus", buttonText: "", isDisabled: $userData.locations.count == 5).disabled($userData.locations.count == 5)
        }.alert("Max locations reached!", isPresented: $viewModel.maximumLocationsAlert, actions: {
            Button("OK", role: .cancel, action: {
                viewModel.maximumLocationsAlert = false
            })
        }, message: {
            Text("You cannot add more than 5 locations!")
        })
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
