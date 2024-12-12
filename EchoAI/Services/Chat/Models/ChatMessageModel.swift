//  /*
//
//  Project EchoAI
//  File: ChatMessageModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.12.2024
//
//  */

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(id: "ms1", chatId: "1", authorId: "user1", content: "Hello, how are you?", seenByIds: ["user2", "user3"], dateCreated: now),
            ChatMessageModel(id: "ms2", chatId: "2", authorId: "user2", content: "I'm good, thanks!", seenByIds: ["user1", "user3"], dateCreated: now.addingTimeInterval(hours: -1)),
            ChatMessageModel(id: "ms3", chatId: "3", authorId: "user3", content: "What about you?", seenByIds: ["user1"], dateCreated: now.addingTimeInterval(hours: -2)),
            ChatMessageModel(id: "ms4", chatId: "4", authorId: "user4", content: "Hello everyone!", seenByIds: ["user1", "user2", "user3"], dateCreated: now.addingTimeInterval(days: -1))
        ]
    }
}
