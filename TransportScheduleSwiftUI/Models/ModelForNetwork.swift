//
//  ModelForNetwork.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import Foundation

import Foundation

// MARK: - Welcome
struct Schedule: Codable {
    let segments: [Segment]
}




// MARK: - Segment
struct Segment: Codable, Identifiable {
    var id = UUID()
    

    
  //
    let thread: Thread
  //  let stops: String
    let from, to: SegmentFrom
    let departurePlatform, arrivalPlatform: String
//    let departureTerminal, arrivalTerminal: JSONNull?
    let duration: Int
   // let hasTransfers: Bool
   let ticketsInfo: TicketsInfo?
    let departure : String
    let arrival: String
//    let startDate: String

    enum CodingKeys: String, CodingKey {
    //
        
        case thread
        //, stops
        case from, to
        case departurePlatform = "departure_platform"
        case arrivalPlatform = "arrival_platform"
//        case departureTerminal = "departure_terminal"
//        case arrivalTerminal = "arrival_terminal"
        case duration
     //   case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
        case departure
        case arrival
//        case startDate = "start_date"
    }
}

// MARK: - SegmentFrom
struct SegmentFrom: Codable {
  //  let type: TypeEnum
  //  let type: String
   // let title: FromTitle
    let title: String
    let shortTitle: String?
    let popularTitle: String?
 //   let code: String
    let stationType: String
    let stationTypeName: String
    let transportType: String

    enum CodingKeys: String, CodingKey {
     //   case type
        case title
        case shortTitle = "short_title"
        case popularTitle = "popular_title"
//        case code
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
        case transportType = "transport_type"
    }
}

// MARK: - Thread
struct Thread: Codable {
    let number, title, shortTitle: String
    let expressType: String?
//

    let transportType: String
//    let carrier: Carrier
//    let uid: String
    let vehicle: String?
    let transportSubtype: TransportSubtype
//    let threadMethodLink: String

    enum CodingKeys: String, CodingKey {
        case number, title
        case shortTitle = "short_title"
        case expressType = "express_type"
        case transportType = "transport_type"
//        case carrier, uid//,
        case vehicle
        case transportSubtype = "transport_subtype"
//        case threadMethodLink = "thread_method_link"
    }
}


// MARK: - TransportSubtype
struct TransportSubtype: Codable {
    let title, code, color: String?
}

// MARK: - TicketsInfo
struct TicketsInfo: Codable {
    let etMarker: Bool
    let places: [Places]

    enum CodingKeys: String, CodingKey {
        case etMarker = "et_marker"
        case places
    }
}

struct Places: Codable{
    let currency : String?
 //   let name : String?
 //   let price : Price?
}
struct Price: Codable{
    let cents : String
    let whole : String
}
