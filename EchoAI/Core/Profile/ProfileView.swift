//  /*
//
//  Project EchoAI
//  File: ProfileView.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettingsView) {
                    SettingsView()
                }
        }
    }
    
    // MARK: - settingsButton
    private var settingsButton: some View {
        Button {
            onSettingsButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline )
        }
    }
    
    // MARK: - onSettingsButtonPressed
    private func onSettingsButtonPressed() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
