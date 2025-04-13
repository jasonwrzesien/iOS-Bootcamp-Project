//
//  iOS_Bootcamp_ProjectApp.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/13/25.
//

import SwiftUI
import FirebaseCore

@main
struct iOS_Bootcamp_ProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
