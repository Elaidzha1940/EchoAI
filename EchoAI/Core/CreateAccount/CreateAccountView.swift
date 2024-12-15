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
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Don't lose your data! Connect to an SSO provider to save your account.")
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
}

#Preview {
    CreateAccountView()
}
