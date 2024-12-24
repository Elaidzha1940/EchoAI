//  /*
//
//  Project EchoAI
//  File: EchoAIApp.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.11.2024
//
//  */

import SwiftUI
import Firebase

@main
struct EchoAIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            EchoView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
