//
//  TakeRequest.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import Foundation

class TakeRequest{
    
    func requestForGetInfo(_ getInfo : InfoRequest) -> URLRequest?{
        guard let _ = URL(string: getInfo.urlstring) else {return nil}
        guard var urlCompanents = URLComponents(string: getInfo.urlstring) else {return nil}
        
        urlCompanents.queryItems = [
            URLQueryItem(name: "apikey", value: MyInfo.apikey.rawValue),
            URLQueryItem(name: "format", value: getInfo.format),
            URLQueryItem(name: "from", value: getInfo.from),
            URLQueryItem(name: "to", value: getInfo.to),
            URLQueryItem(name: "lang", value: getInfo.lang),
            URLQueryItem(name: "date", value: getInfo.date),
            URLQueryItem(name: "transport_types", value: getInfo.transport_types),
            URLQueryItem(name: "limit", value: getInfo.limit)
            
        ]
        
        guard let url = urlCompanents.url else { return nil }
        return URLRequest(url: url)
    }
    
    func requestForCityCode(city : String) -> URLRequest?{
        guard let _ = URL(string: "https://suggests.rasp.yandex.net/all_suggests") else {return nil}
        guard var urlCompanents = URLComponents(string: "https://suggests.rasp.yandex.net/all_suggests") else {return nil}
        
        urlCompanents.queryItems = [
            URLQueryItem(name: "format", value: "old"),
            URLQueryItem(name: "part", value: city)
        ]
        
        guard let url = urlCompanents.url else { return nil }
        return URLRequest(url: url)
    }
}

