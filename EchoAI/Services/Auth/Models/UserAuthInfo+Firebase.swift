//  /*
//
//  Project EchoAI
//  File: UserAuthInfo+Firebase.swift
//  Created by: Elaidzha Shchukin
//  Date: 26.11.2024
//
//  */

import Foundation
import FirebaseAuth

extension UserAuthInfo {
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.isAnonymous = user.isAnonymous
        self.creationDate = user.metadata.creationDate
        self.lastSignInDate = user.metadata.lastSignInDate
    }
}
