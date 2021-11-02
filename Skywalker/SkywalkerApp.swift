import SwiftUI
import Swinject

@main
struct SkywalkerApp: App {
    init(){
        ServiceRegistry.shared.registerServices()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

