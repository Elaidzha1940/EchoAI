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
    @Environment(\.authService) private var authService
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
    }
    
    private func checkUserStatus() async {
        if let user = authService.getAuthenticatedUser() {
            // User is authenticated
        } else {
            // User is not authenticated
            
            do {
                let result = try await authService.signInAnonymously()
            } catch {
                
            }
        }
    }
}

#Preview("EchoView - Tabbar") {
    EchoView(echoState: EchoState(showTabBar: true))
}
#Preview("EchoView - Onboarding") {
    EchoView(echoState: EchoState(showTabBar: false))
}
