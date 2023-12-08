//
//  DateFormatter.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import Foundation

class DateFormat{
    
    
    func dateFormatter(dateString : String) -> String{
        let formatter = ISO8601DateFormatter()

        let date = formatter.date(from: dateString)!
        
        let df = DateFormatter()
        df.dateFormat = "dd MMMM"
       return  df.string(from: date)
        
    }
    
    func dateFormatterHour(dateString : String) -> String{
        let formatter = ISO8601DateFormatter()

        let date = formatter.date(from: dateString)!
        
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
       return  df.string(from: date)
        
    }
    
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func printSecondsToHoursMinutesSeconds(_ seconds: Int) -> String {
      let (h, m, _) = secondsToHoursMinutesSeconds(seconds)
      return "\(h) ч, \(m) мин"
    }
    
        func chosenDate(date: Date) -> String{
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            return df.string(from: date)
        }
    
}
