//
//  UrlManager.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 06.12.2023.
//

import Foundation

final class NetworkingManager {
    
    
    func takeCodesNetwork(firstCity : String, secondCity : String, responce: @escaping ([String]) -> Void) {
        var cityCodes : [String] = []
        guard let requstFirstCity = TakeRequest().requestForCityCode(city: firstCity) else {return}
        guard let requstSecondCity = TakeRequest().requestForCityCode(city: secondCity ) else {return}
        
        let urls = [
            requstFirstCity,
            requstSecondCity
        ]

        let group = DispatchGroup()
        
        for url in urls {

            group.enter()
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                defer {
                    group.leave()
                }
                guard let data = data else {return}
                
                guard let newFiles = try? JSONDecoder().decode([[[String]]?].self, from: data) else {
                    print("error")
                    return
                }
                
                guard let newFiles =  newFiles[1] else {return}
                
                DispatchQueue.main.async {
                    cityCodes.append(newFiles[0][0])
                }
                
                
            }
            task.resume()
        }
        
        
        group.notify(queue: .main) {
            if cityCodes.count == 2{
                responce(cityCodes)
            } else {
                responce(["",""])
            }
        }
    }
    
    func takeScheduleNetwork(_ getInfo : InfoRequest, responce: @escaping (Schedule) -> Void) {

        let url = TakeRequest().requestForGetInfo(getInfo)
        HTTPClient().get(request: url!) { data, response, error in

            guard let newFiles = try? JSONDecoder().decode(Schedule.self, from: data!) else {
                responce(Schedule(segments: []))
                print("error")
                return
            }
            responce(newFiles)
            
        }
    }
    
}
