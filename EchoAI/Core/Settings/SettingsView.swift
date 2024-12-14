//  /*
//
//  Project EchoAI
//  File: ProfileView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import SwiftUI

fileprivate extension View {
    
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(uiColor: .systemBackground))
    }
}

struct SettingsView: View {
    @Environment(EchoState.self) private var echoState
    @Environment(\.dismiss) private var dismiss
    
    @State private var isPremium: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Sign Out")
                        .rowFormatting()
                        .anyButton(.highlight) {
                            onSignOutPressed()
                        }
                        .removeListRowFormatting()
                    
                    Text("Delete account")
                        .foregroundStyle(.mint)
                        .rowFormatting()
                        .anyButton(.highlight) {
                            
                        }
                        .removeListRowFormatting()
                    
                } header: {
                    Text("Account")
                }
                
                //
                Section {
                    HStack(spacing: 8) {
                        Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")
                    }
                    .rowFormatting()
                    .anyButton(.highlight) {
                        onSignOutPressed()
                    }
                    .removeListRowFormatting()
                } header: {
                    Text("Purchases")
                }
                
                //
                Section {
                    Text("Sign Out")
                        .rowFormatting()
                        .anyButton(.highlight) {
                            onSignOutPressed()
                        }
                        .removeListRowFormatting()
                    
                    Text("Delete account")
                        .foregroundStyle(.mint)
                        .rowFormatting()
                        .anyButton(.highlight) {
                            
                        }
                        .removeListRowFormatting()
                    
                } header: {
                    Text("Account")
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
