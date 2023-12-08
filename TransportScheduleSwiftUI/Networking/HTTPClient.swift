//
//  HTTPClient.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import Foundation


class HTTPClient {

    typealias completeClosure = (_ data: Data?,_ response: URLResponse?, _ error: Error?) -> Void


    func get(url: URL, callback: @escaping completeClosure) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            callback(data, response, error)
        }
        .resume()
    }
    
    func get(request:URLRequest , callback: @escaping completeClosure) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            callback(data, response, error)
        }
        .resume()
    }
    
}
