//  /*
//
//  Project EchoAI
//  File: EchoView.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

struct EchoView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    @State var echoState: EchoState = EchoState()
    
    var body: some View {
        EchoViewBuilder(
            showTabBar: echoState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(echoState)
        .task {
            await checkUserStatus()
        }
        .onChange(of: echoState.showTabBar) { _, showTabBar in
            if !showTabBar {
                Task {
                    await checkUserStatus()
                }
            }
        }
    }
    
    private func checkUserStatus() async {
        if let user = authManager.auth {
            // User is authenticated
            print("User already authenticated \(user.uid)")
            
            do {
                try await userManager.logIn(auth: user, isNewUser: false)
            } catch {
                print("Failed to log in to auth for existing user: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
            
        } else {
            // User is not authenticated
            do {
                let result = try await authManager.signInAnonymously()
                
                // Log in to App
                print("Sign in anonymous success \(result.user.uid)")
                
                // Log in
                try await userManager.logIn(auth: result.user, isNewUser: result.isNewUser)
                
            } catch {
                print("Failed to sign in anonymously and log in: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
        }
    }
}

//#Preview("EchoView - Tabbar") {
//    EchoView(echoState: EchoState(showTabBar: true))
//}

#Preview("EchoView - Onboarding") {
    EchoView(echoState: EchoState(showTabBar: false))
}
