//  /*
//
//  Project EchoAI
//  File: CreateAvatarView.swift
//  Created by: Elaidzha Shchukin
//  Date: 16.11.2024
//
//  */

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton(.plain) {
                onBackButtonPressed()
            }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
}

#Preview {
    CreateAvatarView()
}
