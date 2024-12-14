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

// MARK: AvatarDescriptionBuilder
struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var characterDescription: String {
        let prefix = characterOption.startsWithVowel ? "An" : "A"
        return "\(prefix) \(characterOption.rawValue) \(characterAction.rawValue) music on a floating platform in the middle of the \(characterLocation.rawValue)"
    }
}

// MARK: CharacterOption
enum CharacterOption: String, CaseIterable, Hashable {
    case man, car, city, woman, dog, cat, alien
    
    static var `default`: Self {
        .man
    }
    
    var startsWithVowel: Bool {
        switch self {
        case .alien:
            return true
        default:
            return false
        }
    }
}

// MARK: CharacterAction
enum CharacterAction: String {
    case smiling, dancing, walking, eating, shopping, relaxing, fighting, crying, working, studying, drinking, chilling, DJing, performing
    
    static var `default`: Self {
        .dancing
    }
}

// MARK: CharacterLocation
enum CharacterLocation: String {
    case park, desert, city, ocean, forest, space, mall, cafe, bar, club
    
    static var `default`: Self {
        .city
    }
}
