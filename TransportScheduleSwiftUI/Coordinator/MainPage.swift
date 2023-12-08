//
//  MainPage.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 07.12.2023.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var coordinator : Coordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPages.home)
                .navigationDestination(for: MyPages.self) { page in
                    coordinator.getPage(page)
                }
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        MainPage()
            .environmentObject(coordinator)
    }
}
