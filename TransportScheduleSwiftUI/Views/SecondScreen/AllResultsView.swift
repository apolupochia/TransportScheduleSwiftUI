//
//  AllResultsView.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 08.12.2023.
//

import SwiftUI

struct AllResultsView: View {
    @ObservedObject var  coordinator : Coordinator
    var body: some View {
        ZStack{
            if coordinator.downloadingInfo != ""{
                Text(coordinator.downloadingInfo)
                    .foregroundColor(.gray)
            }
            ScrollView {
                
                ForEach(coordinator.info.segments) { cell in
                    CellView(coordinator: coordinator, segnent: cell)
                        .padding(.horizontal)
                }
                .navigationBarBackButtonHidden()
                .navigationBarItems(leading:
                                        Button(action: {
                    coordinator.goHome()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 15, height: 15)
                })
                )
            }
        }
        
    }
}

struct AllResultsView_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        AllResultsView(coordinator: coordinator)
    }
}
