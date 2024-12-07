//  /*
//
//  Project EchoAI
//  File: OnboardingCompletedView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(EchoState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            
            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
    
    func onFinishButtonPressed() {
        // Other logic to complete onboarding
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(EchoState())
}
