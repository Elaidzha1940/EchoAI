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
    
    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            TextField("Saysomething...", text: $textField)
                .keyboardType(.alphabet)
                .autocorrectionDisabled()
                .padding(12)
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
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
    }
    
    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
        }
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
