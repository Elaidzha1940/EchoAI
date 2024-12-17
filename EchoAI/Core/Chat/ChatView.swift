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
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        Text(message.content ?? "")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(.mint)
            
            Rectangle()
                .frame(height: 50)
        }
    }
}

#Preview {
    ChatView()
}
