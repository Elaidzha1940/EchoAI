//  /*
//
//  Project EchoAI
//  File: ChatView.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.11.2024
//
//  */

import SwiftUI

struct ChatView: View {
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock
    @State private var textField: String = ""
    @State private var scrollPosition: String?
    
    @State private var showAlert: AnyAppAlert?
    @State private var showChatSettings: AnyAppAlert?
    @State private var showProfileModal: Bool = false
    
    var avatarId: String = AvatarModel.mock.avatarId
    
    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            texFieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .showCustomAlert(type: .confirmationDialog, alert: $showChatSettings)
        .showCustomAlert(alert: $showAlert)
        .showModal(showModal: $showProfileModal) {
            if let avatar {
                profileModal(avatar: avatar)
            }
        }
    }
    
    // MARK: - scrollViewSection
    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName,
                        onImagePressed: onAvatarImagePressed
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }
    
    // MARK: - texFieldSection
    private var texFieldSection: some View {
        TextField("Saysomething...", text: $textField)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .padding(.trailing, 4)
                    .foregroundStyle(.accent)
                    .anyButton(.plain) {
                        onSendMessagePressed()
                    }
                , alignment: .trailing
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.03), lineWidth: 1)
                }
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }
    
    // MARK: - profileModal
    private func profileModal(avatar: AvatarModel) -> some View {
        ProfileModalView(
            imageName: avatar.profileImageName,
            title: avatar.name,
            subtitle: avatar.characterOption?.rawValue.capitalized,
            headline: avatar.characterDescription,
            onXMarkPressed: {
                showProfileModal = false
            }
        )
        .padding(40)
        .transition(.slide)
    }
    
    // MARK: - onSendMessagePressed
    private func onSendMessagePressed() {
        guard let currentUser else { return }
        let content = textField
        
        do {
            try TextValidationHelper.checkIfTextIsValid(text: content)
            let message = ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authorId: currentUser.userId,
                content: content,
                seenByIds: nil,
                dateCreated: .now)
            chatMessages.append(message)
            
            scrollPosition = message.id
            textField = ""
            
        } catch {
            showAlert = AnyAppAlert(error: error)
        }
    }
    
    // MARK: - onChatSettingsPressed
    private func onChatSettingsPressed() {
        showChatSettings = AnyAppAlert(
            title: "",
            subtitle: "What would you like to do?",
            buttons: {
                AnyView(
                    Group {
                        Button("Report User / Chat", role: .destructive) {
                            //
                        }
                        Button("Delete Chat", role: .destructive) {
                            //
                        }
                    }
                )
            }
        )
    }
    
    // MARK: - onAvatarImagePressed
    private func onAvatarImagePressed() {
        showProfileModal = true
    }
    
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
