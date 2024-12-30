//  /*
//
//  Project EchoAI
//  File: CreateAccountView.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.11.2024
//
//  */

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.authService) private var authService
    @Environment(\.dismiss) private var dismiss
    
    var title: String = "Create Account"
    var subTitle: String = "Don't lose your data! Connect to an SSO provider to save your account."
    var onDidSignIn: ((_ inNewUser: Bool) -> Void)
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 4) {
                SignInWithAppleButtonView(
                    type: .signIn,
                    style: .black, cornerRadius: 10)
                .frame(height: 55)
                .anyButton(.press) {
                    onSignInApplePressed()
                }
            }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
    
    // MARK: - onSignInApplePressed
    func onSignInApplePressed() {
        Task {
            do {
                //                let result = try await authService.signInApple()
                _ = try await authService.signInApple()
                
                print("Did sign in with apple.")
                onDidSignIn?(result.isNewUser)
                dismiss()
            } catch {
                print("Eror signing in with apple.")
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
