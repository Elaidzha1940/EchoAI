//  /*
//
//  Project EchoAI
//  File: ChatBubbleViewBuilder.swift
//  Created by: Elaidzha Shchukin
//  Date: 17.11.2024
//
//  */

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName)
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(isCurrentUser: true)
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Hooo, Hooo, Hooo, Hooo, Hooo, Hooo, Hooo, Hooo!",
                    seenByIds: nil,
                    dateCreated: .now))
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Hooo, Hooo, Hooo, Hooo, Hooo, Hooo, Hooo, Hooo!",
                    seenByIds: nil,
                    dateCreated: .now),
                isCurrentUser: true)
            
        }
        .padding(12)
    }
}
