//  /*
//
//  Project EchoAI
//  File: OnboardingIntroView.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.12.2024
//
//  */

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("avatars ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with them\n\nHave ")
                +
                Text("real conversation ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("with AI generated responses.")
            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(25)
            
            NavigationLink {
                OnboardingCompletedView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .padding(24)
        .font(.title3)
    }
}

#Preview {
    OnboardingIntroView()
}
