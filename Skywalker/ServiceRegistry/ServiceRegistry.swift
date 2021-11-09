import Foundation
import Swinject

class ServiceRegistry {
    static let shared = ServiceRegistry()
    private let container: Container = Container()
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType);
    }
    
    func registerServices() {
        container.register(WeatherApi.self) { _  in
            WeatherApi()
        }.inObjectScope(.container)
    }
}
