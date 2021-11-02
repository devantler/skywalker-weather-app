import Swinject

class ServiceRegistry {
    static let shared = ServiceRegistry()
    private let container: Container = Container()
    
    public func getContainer() -> Container {
        return container;
    }
    
    func registerServices() {
        container.register(WeatherApi.self) { _  in
            return WeatherApi()
        }.inObjectScope(.container)
        //Add all services the app needs.
    }
}
