import Foundation
import Swinject

@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = ServiceRegistry.shared.getContainer().resolve(Component.self)!
    }
}
