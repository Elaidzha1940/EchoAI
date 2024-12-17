//  /*
//
//  Project EchoAI
//  File: AvatarModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import Foundation

struct AvatarModel: Hashable {
    
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            AvatarModel(avatarId: UUID().uuidString, name: "Black Coffee", characterOption: .man, characterAction: .DJing, characterLocation: .ocean, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            
            AvatarModel(avatarId: UUID().uuidString, name: "Claptone", characterOption: .man, characterAction: .dancing, characterLocation: .club, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            
            AvatarModel(avatarId: UUID().uuidString, name: "Lou Vegga", characterOption: .dog, characterAction: .chilling, characterLocation: .bar, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            
            AvatarModel(avatarId: UUID().uuidString, name: "Bedouin", characterOption: .cat, characterAction: .eating, characterLocation: .desert, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            
            AvatarModel(avatarId: UUID().uuidString, name: "Dunmore", characterOption: .city, characterAction: .drinking, characterLocation: .cafe, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
            
        ]
    }
}
