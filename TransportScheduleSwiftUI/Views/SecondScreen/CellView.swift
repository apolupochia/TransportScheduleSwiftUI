//
//  CellView.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 07.12.2023.
//

import SwiftUI

struct CellView: View {
    @ObservedObject var  coordinator : Coordinator
    let segnent : Segment
    @State var hide = true
    
    var body: some View {
        HStack( spacing: 0){
            
            ZStack{
                Image(segnent.thread.transportType)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                
              
            }
                .frame(height: UIScreen.main.bounds.height * 0.15, alignment: .top)
            
            Text("\(segnent.thread.shortTitle)")
                .font(.caption)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                .frame(height: UIScreen.main.bounds.height * 0.15 - 8, alignment: .top)
            Spacer()
            
            VStack(alignment: .leading){
                Text(DateFormat().dateFormatter(dateString: segnent.departure))
                    .font(.caption)
                
                Text(DateFormat().dateFormatterHour(dateString: segnent.departure))

                Text(segnent.from.title)
                    .font(.caption)
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
            .frame(height: UIScreen.main.bounds.height * 0.15 - 8, alignment: .top)
            Spacer()
            VStack{
                Text("")
                Text(DateFormat().printSecondsToHoursMinutesSeconds(segnent.duration))
            }
                .frame(height: UIScreen.main.bounds.height * 0.15 - 8, alignment: .top)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
            Spacer()
            VStack(alignment: .leading){
                
                Text(DateFormat().dateFormatter(dateString: segnent.arrival))
                    .font(.caption)
                
                Text(DateFormat().dateFormatterHour(dateString: segnent.arrival))
                   // .font(.caption)
                
                Text(segnent.to.title)
                    .font(.caption)
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
            .frame(height: UIScreen.main.bounds.height * 0.15 - 8, alignment: .top)
            
        }
        .frame(height: UIScreen.main.bounds.height * 0.15)
        .background(Color(hex: "#F6F6F9"))
        .cornerRadius(6)
    }
}

//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellView(segnent: Segment(from: SegmentFrom(title: "", shortTitle: "", stationType: "", stationTypeName: "", transportType: ""), to: SegmentFrom(title: "", shortTitle: "", stationType: "", stationTypeName: "", transportType: ""), departurePlatform: "", arrivalPlatform: "", duration: 0, ticketsInfo: nil))
//    }
//}
