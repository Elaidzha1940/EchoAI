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
    var title: String = "Create Account"
    var subTitle: String = "Don't lose your data! Connect to an SSO provider to save your account."
    
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
                    //
                }
            }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
}

#Preview {
    CreateAccountView()
}
