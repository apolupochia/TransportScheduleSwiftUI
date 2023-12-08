//
//  ContentView.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 05.12.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var  coordinator : Coordinator

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Расписание пригородного и международного транспорта")
                .padding(.horizontal)
                .font(.title3)
                .bold()
            
            chooseCities()
            ButtonsChoiceDateView(coordinator: coordinator)
            chooseTransport()
            enterButton()
        }
    }
    
    
    func chooseCities() -> some View {
        HStack{
            Spacer()
            VStack{
                TextField("От куда", text: $coordinator.firstCity)

                    .frame(width: UIScreen.main.bounds.width * 0.75, alignment: .leading)
                    .frame(height: UIScreen.main.bounds.height * 0.03)

                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width * 0.75)
                TextField("Куда", text: $coordinator.secondCity)

                .frame(width: UIScreen.main.bounds.width * 0.75, alignment: .leading)
                .frame(height: UIScreen.main.bounds.height * 0.03)

            }
            Spacer()
            Button {
                let a = coordinator.firstCity
                coordinator.firstCity = coordinator.secondCity
                coordinator.secondCity = a
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.vertical)
        .overlay(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .stroke()
                .opacity(0.5)
        )
        .padding(.horizontal)
            
    }
    

    
    func chooseTransport() -> some View {
        HStack{
            ForEach(choiseItems) { item in
                Button {
                    coordinator.chooseItem = item.item
                } label: {
                    VStack{
                        ZStack{
                            if item.item == Item.all{
                                Text("любой")
                                    .frame( height: 25)
                            } else {
                                Image(systemName: item.icon)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            
                        }
                        .foregroundColor( item.item == coordinator.chooseItem ? .white : .black)
                    }
                    .padding(16)
                    
                    .background( item.item == coordinator.chooseItem ? .black : .white)
                    .cornerRadius(4)
                    
                }
                if item.item != Item.bus{
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        
    }

    
    func enterButton() -> some View {
        Button {
            coordinator.getStationCode()
            coordinator.goAllResultsView()
        } label: {
            HStack{
                Spacer()
                Text("Найти")
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .padding(.vertical)
        .background(Color.blue)
        
        .cornerRadius(6)
        .padding(.horizontal)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(coordinator: Coordinator())
    }
}


