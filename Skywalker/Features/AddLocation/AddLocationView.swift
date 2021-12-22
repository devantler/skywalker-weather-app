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
                userData.saveLocation(locationName: viewModel.location.name)
                viewModel.location.name = ""
                Task.init(priority: TaskPriority.medium) {
                    await updateViewModel()
                }
            }, iconSystemName: "plus", buttonText: "", isDisabled: $userData.locations.count == 5).disabled($userData.locations.count == 5)
        }.alert("Max locations reached!", isPresented: $viewModel.maximumLocationsAlert, actions: {
            Button("OK", role: .cancel, action: {
                viewModel.maximumLocationsAlert = false
            })
        }, message: {
            Text("You cannot add more than 5 locations!")
        })
    }
    
    private func updateViewModel() async {
        try? await Task.sleep(nanoseconds: 0_100_000_000)
        viewModel.invalidLocationName = userData.saveLocationError == .invalidLocationName
        viewModel.maximumLocationsAlert = userData.saveLocationError == .maxLocationsReached
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
