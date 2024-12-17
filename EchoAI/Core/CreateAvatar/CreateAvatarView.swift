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
    
    @State private var avatarName: String = ""
    
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    
    @State private var isGenerateing: Bool = false
    @State private var generatedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                attributesSection
                imageSection
                
                Section {
                    Text("Save")
                }
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
    
    // MARK: - backButton
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton(.plain) {
                onBackButtonPressed()
            }
    }
    
    // MARK: - nameSection
    private var nameSection: some View {
        Section {
            TextField("Player 1", text: $avatarName)
        } header: {
            Text("Name your avatar*")
        }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    // MARK: - attributesSection
    private var attributesSection: some View {
        Section {
            Picker(selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("is a...")
            }
            
            Picker(selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("that is...")
            }
            
            Picker(selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("in the...")
            }
            
        } header: {
            Text("Attributes")
        }
    }
    
    // MARK: - imageSection
    private var imageSection: some View {
        Section {
            HStack(alignment: .top, spacing: 8) {
                ZStack {
                    Text("Generate image")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton(.plain) {
                            onGenerateImagePressed()
                        }
                        .opacity(isGenerateing ? 0 : 1)
                    
                    ProgressView()
                        .tint(.accentColor)
                        .opacity(isGenerateing ? 1 : 0)
                }
                Circle()
                    .fill(Color.secondary.opacity(0.3))
                    .overlay(
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                
                            }
                        }
                    )
                    .clipShape(Circle())
            }
            .removeListRowFormatting()
        }
    }
    
    private func onGenerateImagePressed() {
        isGenerateing = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            generatedImage = UIImage(systemName: "person.fill")
            
            isGenerateing = false
        }
    }
}

#Preview {
    CreateAvatarView()
}
