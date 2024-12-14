//  /*
//
//  Project EchoAI
//  File: ChatModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 13.12.2024
//
//  */

import Foundation

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        let now = Date()
        return [
            UserModel(
                userId: "user1",
                dateCreated: now,
                didCompleteOnboarding: true,
                profileColorHex: "#FF5733"
            ),
            UserModel(
                userId: "user2",
                dateCreated: now.addingTimeInterval(days: -1),
                didCompleteOnboarding: false,
                profileColorHex: "#33FF57"
            ),
            UserModel(
                userId: "user3",
                dateCreated: now.addingTimeInterval(days: -3, hours: -2),
                didCompleteOnboarding: true,
                profileColorHex: "#3357FF"
            ),
            UserModel(
                userId: "user4",
                dateCreated: now.addingTimeInterval(days: -5, hours: -4),
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
    
}
