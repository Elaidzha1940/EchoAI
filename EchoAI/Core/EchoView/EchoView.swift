//  /*
//
//  Project EchoAI
//  File: EchoView.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

// Tabbar - Signed in
// Onboarding - Signed out

struct EchoView: View {
    @AppStorage("showTabbarView") var showTabBar: Bool = false

    var body: some View {
        EchoViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview("EchoView - Tabbar") {
    EchoView()
}
#Preview("EchoView - Onboarding") {
    EchoView()
}
