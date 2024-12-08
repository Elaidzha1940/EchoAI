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
    @State var imageName: String = Constants.randomImage
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 20)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("Echo AI Ե")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("EchoAI - your intelligent companion, reflecting your thoughts and ideas.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an aacount? Sign in!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of Service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
