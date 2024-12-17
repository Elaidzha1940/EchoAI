//  /*
//
//  Project EchoAI
//  File: AvatarAttributes.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import Foundation

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
enum CharacterAction: String, CaseIterable, Hashable {
    case smiling, dancing, walking, eating, shopping, relaxing, fighting, crying, working, studying, drinking, chilling, DJing, performing
    
    static var `default`: Self {
        .dancing
    }
}

// MARK: CharacterLocation
enum CharacterLocation: String, CaseIterable, Hashable {
    case park, desert, city, ocean, forest, space, mall, cafe, bar, club
    
    static var `default`: Self {
        .city
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
