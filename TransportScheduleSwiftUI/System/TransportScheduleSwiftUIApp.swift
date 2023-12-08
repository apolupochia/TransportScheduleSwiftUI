//
//  TransportScheduleSwiftUIApp.swift
//  TransportScheduleSwiftUI
//
//  Created by Алёша Виноградов on 05.12.2023.
//

import SwiftUI

@main
struct TransportScheduleSwiftUIApp: App {
    @StateObject var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environmentObject(coordinator)
        }
    }
}
