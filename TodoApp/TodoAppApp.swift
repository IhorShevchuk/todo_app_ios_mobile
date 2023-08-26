//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ihor Shevchuk on 26.08.2023.
//
//

import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(dataStore: DataStore()))
        }
    }
}
