//  /*
//
//  Project EchoAI
//  File: ChatRowCellViewBuilder.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.11.2024
//
//  */

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: avatar?.name,
            subheadline: lastChatMessage?.content,
            hasNewChat: false
        )
        .task {
            avatar = await getAvatar()
        }
        .task {
            lastChatMessage = await getLastMessage()
        }
    }
}

#Preview {
    ChatRowCellViewBuilder(chat: .mock) {
        return .mock
    } getLastMessage: {
        return .mock
    }
}
