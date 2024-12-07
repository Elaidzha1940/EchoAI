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
    }
}

#Preview("EchoView - Tabbar") {
    EchoView(echoState: EchoState(showTabBar: true))
}
#Preview("EchoView - Onboarding") {
    EchoView(echoState: EchoState(showTabBar: false))
}
