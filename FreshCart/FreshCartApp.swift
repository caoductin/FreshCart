//
//  FreshCartApp.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/7/24.
//

import SwiftUI

@main
struct FreshCartApp: App {
    @StateObject var MainVM = MainViewModel.shared;
    @State private var navigationPath = NavigationPath() // Manage the path
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
             
                if  MainVM.isUserLogin  {
               MainView()
//                        .onAppear {
//                                                  navigationPath.removeLast(navigationPath.count) // Reset path if login state changes
//                                              }
                }
                else{
                    WelcomeView()
                        .environmentObject(MainVM)
                   
                }
                
       
            }
        }
    }
}


