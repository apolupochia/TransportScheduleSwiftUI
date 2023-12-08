//
//  Models.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import Foundation

// MARK: - for MainPage


var choiseItems = [
    DeviceItem(icon: "NO", item: .all),
    DeviceItem(icon: "airplane", item: .plane),
    DeviceItem(icon: "train.side.front.car", item: .train),
    DeviceItem(icon: "train.side.rear.car", item: .suburban),
    DeviceItem(icon: "bus.fill", item: .bus)

]

struct DeviceItem: Identifiable {
    var id = UUID()
    var icon: String
    var item: Item
}

enum Item: String {

    case all = ""
    case plane = "plane"
    case train = "train"
    case suburban = "suburban"
    case bus = "bus"

}



var chooseDate = [
    ChooseDateStruct(name: "Сегодня", date: .today),
    ChooseDateStruct(name: "Завтра", date: .tomorrow),
    ChooseDateStruct(name: "Дата", date: .chooseDay)
]


struct ChooseDateStruct : Identifiable{
    var id = UUID()
    var name : String
    var date : ChooseDateEnum
}

enum ChooseDateEnum : String{
    case today = "Сегодня"
    case tomorrow = "Завтра"
    case chooseDay = "Дата"
}

// MARK: - for Coordinator

enum MyPages : String, CaseIterable, Identifiable{
    case home
    case allResultsView
    
    var id: String {self.rawValue}
}


struct InfoRequest{
    let urlstring = "https://api.rasp.yandex.net/v3.0/search/"
    let from : String
    let to : String
    let format : String
    let lang : String = "ru_RU"
    let date : String
    let transport_types : String
    let limit : String
}

