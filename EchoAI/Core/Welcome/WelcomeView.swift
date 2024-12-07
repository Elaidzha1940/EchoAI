//  /*
//
//  Project EchoAI
//  File: WelcomeView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome!")
                    .frame(maxHeight: .infinity)
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get Started")
                        .callToActionButton()
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    WelcomeView()
}
