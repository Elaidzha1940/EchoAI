//  /*
//
//  Project EchoAI
//  File: ProfileView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import SwiftUI

struct SettingsView: View {
    @Environment(EchoState.self) private var echoState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignOutPressed() {
        // do some logic Sign user Out of app!
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            echoState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(EchoState())
}
