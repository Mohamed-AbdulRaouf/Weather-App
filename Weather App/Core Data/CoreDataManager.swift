//
//  CoreDataManager.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import UIKit
import CoreData

typealias CitiesCompletionHandler = (_ data: [String]?) -> Void
typealias HistoricalDataCompletionHandler = (_ data: [HistoricalData]?) -> Void

class CoreDataManager {
    
    // MARK: Variables declearations
    public static var shared = CoreDataManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    
    // MARK: Methods to Open, Store and Fetch data
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveCityName(_ cityName: String) {
        let entity = NSEntityDescription.entity(forEntityName: "City", in: context)
        let city = NSManagedObject(entity: entity!, insertInto: context)
        city.setValue(cityName, forKey: "city_name")
        print("Storing Data..")
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Storing data Failed")
        }
    }
    
    func fetchCitiesData(completionHandler: @escaping CitiesCompletionHandler) {
        print("Fetching Data..")
        var cities = [String]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let cityname = data.value(forKey: "city_name") as! String
                print("User Name is : "+cityname)
                cities.append(cityname)
            }
            completionHandler(cities)
        } catch {
            print("Fetching data Failed")
        }
    }
    
    func saveHistoricalData(cityName: String,
                            weatherType: String,
                            weatherDegree: Double) {
        let entity = NSEntityDescription.entity(forEntityName: "WeatherInfo", in: context)
        let weatherInfo = NSManagedObject(entity: entity!, insertInto: context)
        weatherInfo.setValue(cityName, forKey: "city_name")
        weatherInfo.setValue(weatherType, forKey: "weather_type")
        weatherInfo.setValue(weatherDegree, forKey: "weather_degree")
        weatherInfo.setValue(Date(), forKey: "date")
        print("Storing Data..")
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Storing data Failed")
        }
    }
    
    func fetchCitiesDataBy(cityName: String, completionHandler: @escaping HistoricalDataCompletionHandler) {
        print("Fetching Data..")
        var historicalData = [HistoricalData]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherInfo")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if cityName == data.value(forKey: "city_name") as! String {
                    let weatherType = data.value(forKey: "weather_type") as! String
                    let weatherDegree = data.value(forKey: "weather_degree") as! Double
                    let date = data.value(forKey: "date") as! Date
                    historicalData.append(HistoricalData(weatherType: weatherType, weatherDegree: weatherDegree, date: date))
                }
            }
            completionHandler(historicalData)
        } catch {
            print("Fetching data Failed")
        }
    }
}
