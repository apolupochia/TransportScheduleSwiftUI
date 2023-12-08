//
//  ButtonsChoiceDateView.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import SwiftUI

struct ButtonsChoiceDateView: View {
    @ObservedObject var  coordinator : Coordinator
    var body: some View {
        HStack(spacing: 0){
            ForEach(chooseDate) { item in
                if item.date == ChooseDateEnum.chooseDay{
                    Button {
                        coordinator.chooseDate = item.date
                        print("chooseDate = \(coordinator.chooseDate.rawValue)")
                    } label: {
                        HStack{
                            Spacer()
                            Text(item.name)
                            Spacer()
                        }
                    }
                    .padding()
                    .frame( height: 60)
                    .foregroundColor( item.date == coordinator.chooseDate ? .white : .black)
                    .background( item.date == coordinator.chooseDate ? .black : .white)
                    .cornerRadius(  item.date == ChooseDateEnum.chooseDay ? 6 : 0 , corners: [.topRight, .bottomRight])
                    
                    .overlay {
                        DatePicker("", selection: $coordinator.date, in: Date()...(Calendar.current.date(byAdding: .day, value: 90, to: Date()) ?? Date()) , displayedComponents: [.date])
                            .blendMode(.destinationOver)
                    }
                    .onTapGesture {
                        coordinator.chooseDate = item.date
                    }
                } else {
                    Text("")
                    Button {
                        coordinator.chooseDate = item.date
                        
                        if coordinator.chooseDate == ChooseDateEnum.today{
                            print("Сегодня")
                            coordinator.date = Date()
                            print(coordinator.date)
                        } else {
                            print("Завтра")
                            coordinator.date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
                            print(coordinator.date)
                        }
                    } label: {
                        HStack{
                            
                            Spacer()
                            Text(item.name)
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .frame( height: 60)
                    .foregroundColor( item.date == coordinator.chooseDate ? .white : .black)
                    .background( item.date == coordinator.chooseDate ? .black : .white)
                    .cornerRadius(  item.date == ChooseDateEnum.today ? 6 : 0 , corners: [.topLeft, .bottomLeft])
                    
                }
                
            }
        }
        .padding(.horizontal)
        
    }
}

struct ButtonsChoiceDateView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsChoiceDateView(coordinator: Coordinator())
    }
}
