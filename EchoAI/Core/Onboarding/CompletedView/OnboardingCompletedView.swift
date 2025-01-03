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
    @Environment(UserManager.self) private var userManager
    
    @State private var isCompletingProfileSetup: Bool = false
    var selectedColor: Color = .brown
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've set up your profile and you you're ready to start chatting.")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            AsyncCallToActionButton(
                isLoading: isCompletingProfileSetup,
                title: ("Finish"),
                action: onFinishButtonPressed)
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    // MARK: - onFinishButtonPressed
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        
        Task {
            
            let hex = selectedColor.toHex() ?? Constants.accentColorHex
            try await userManager.markOnboardingCompleteForCurrentUser(profileColorHex: hex)
            
            // dismiss screen
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(UserManager(service: MockUserService()))
        .environment(EchoState())
}
