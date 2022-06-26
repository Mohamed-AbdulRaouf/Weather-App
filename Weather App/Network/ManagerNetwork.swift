//
//  ManagerNetwork.swift
//  Weather App
//
//  Created by mohamed on 6/26/22.
//

import UIKit
import AFNetworking

typealias CompletionHandler = (_ data: WeatherModel?, _ error: Error?) -> Void
typealias ImageCompletionHandler = (_ data: UIImage?, _ error: Error?) -> Void

final class ManagerNetwork {
    
    public static var shared = ManagerNetwork()
    
    var manager = AFHTTPSessionManager()
    
    func searchByCity(_ cityName: String, completionHandler: @escaping CompletionHandler) {
        
        let parm = ["q" : cityName,
                    "APPID": Constants.shared.APPID,
                    "units": "metric"]
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.get(APIEndPoints.searchCity.rawValue, parameters: parm, headers: nil, progress: nil) { dataTask, response in
            guard let data = response as? Data else { return }
            let decoder = JSONDecoder()
            do {
                let decoded = try decoder.decode(WeatherModel.self, from: data)
                print(decoded)
                completionHandler(decoded, nil)
            } catch {
                print(error)
                completionHandler(nil, error)
            }
        } failure: { session, error in
            completionHandler(nil, error)
            print(error.localizedDescription)
        }
    }
    
    func downloadImage(iconName: String, completionHandler: @escaping ImageCompletionHandler) {
        let imagePath = "\(APIEndPoints.downloadImage.rawValue)\(iconName).png"
        let url = URL(string: imagePath)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                completionHandler(nil,error)
                return
            }
            guard let image = UIImage(data: data!) else {return}
            completionHandler(image,nil)
        }).resume()
    }
}
