//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 04/05/25.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn


@main
struct TodoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            
        }
    }
}
