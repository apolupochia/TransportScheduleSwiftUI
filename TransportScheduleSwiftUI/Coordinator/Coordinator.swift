//
//  Coordinator.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 07.12.2023.
//

import Foundation
import SwiftUI

@MainActor
class Coordinator : ObservableObject{
    
    @Published var path = NavigationPath()
    @Published var page : MyPages = .home
    
    @Published var info : Schedule = Schedule(segments: [])
    
    @Published var firstCity = ""
    @Published var secondCity = ""
    
    @Published var date = Date()
    
    @Published var chooseItem :Item = .all
    @Published var chooseDate :ChooseDateEnum = .today
    
    @Published var downloadingInfo = "Загрузка"
    
    
    
    func goBack(){
        path.removeLast()
    }
    
    func goHome(){
        path.removeLast(path.count)
        info = Schedule(segments: [])
        downloadingInfo = "Загрузка"
   
    }
    
    func goAllResultsView(){
        path.append(MyPages.allResultsView)

    }
    
    
    
    
    func getInfo(_ getInfo : InfoRequest){
        NetworkingManager().takeScheduleNetwork(getInfo) { schedule in
            DispatchQueue.main.async {
                if schedule.segments.count == 0{
                    self.downloadingInfo = "Неверные данные"
                } else {
                    self.downloadingInfo = ""
                }
                self.info = schedule
            }
            
        }
    }
    

    func getStationCode(){
        
        NetworkingManager().takeCodesNetwork(firstCity: firstCity, secondCity: secondCity) { codes in
            if codes[0] == "" && codes[1] == ""{
                self.downloadingInfo = "Неверные данные"
            }
            self.takeInfoForRequest(firstCityCode: codes[0], secondCityCode: codes[1])
        }
    }
    
    func takeInfoForRequest(firstCityCode : String, secondCityCode : String){
        let infoForRequest = InfoRequest(from: firstCityCode, to: secondCityCode, format: "json", date: DateFormat().chosenDate(date: date), transport_types: chooseItem.rawValue, limit: "10")
        getInfo(infoForRequest)
    }
    

    
    @ViewBuilder
    func getPage( _ page : MyPages) -> some View{
        switch page{
        case .home:
            MainView(coordinator: self)
        case .allResultsView:
            AllResultsView(coordinator: self)
        }
    }
}



