//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-25.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(listViewModel)
            
        }
        
    }
}
