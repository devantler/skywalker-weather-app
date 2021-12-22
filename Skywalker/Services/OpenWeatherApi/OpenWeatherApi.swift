import Foundation

class OpenWeatherApi: ObservableObject{
    func fetchGeoLocation(city: String, completion: @escaping (Double, Double) -> Void){
        let url = "https://api.openweathermap.org/geo/1.0/direct?q=\(city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)&limit=1&appid=7b22a3a1174e9275a9916a73062eed8e"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(0, 0)
                return
            }
            if let data = data, let geoLocations = try? JSONDecoder().decode([GeoLocationDTO].self, from: data) {
                guard let geolocation = geoLocations.first else {
                    print("Geolocation is nil")
                    completion(0, 0)
                    return
                }
                DispatchQueue.main.async {
                    completion(geolocation.lat, geolocation.lon)
                }
            } else {
                completion(0, 0)
               print("Something went wrong. Try again.")
           }
        }).resume()
    }
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (WeatherCollectionDTO) -> Void){
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&units=metric&exclude=minutely,hourly,alerts0&appid=7b22a3a1174e9275a9916a73062eed8e"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let weather = try? JSONDecoder().decode(WeatherCollectionDTO.self, from: data) {
                DispatchQueue.main.async {
                    completion(weather)
                }
            } else {
                print("Something went wrong. Try again.")
            }
        }).resume()
    }
}
