//  /*
//
//  Project EchoAI
//  File: FirebaseAuthService.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.11.2024
//
//  */

import SwiftUI
import FirebaseAuth

extension EnvironmentValues {
    @Entry var authService: FirebaseAuthService = FirebaseAuthService()
}

struct UserAuthInfo: Sendable {
    let uid: String
    let email: String?
    let isAnonymous: Bool
    let creationDate: Date?
    let lastSignInDate: Date?
    
    init(
        uid: String,
        email: String? = nil,
        isAnonymous: Bool = false,
        creationDate: Date? = nil,
        lastSignInDate: Date? = nil
    ) {
        self.uid = uid
        self.email = email
        self.isAnonymous = isAnonymous
        self.creationDate = creationDate
        self.lastSignInDate = lastSignInDate
    }
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.isAnonymous = user.isAnonymous
        self.creationDate = user.metadata.creationDate
        self.lastSignInDate = user.metadata.lastSignInDate
    }
}

struct FirebaseAuthService {
    
    func getAuthenticatedUser() -> User? {
        if let user = Auth.auth().currentUser {
            return user
        }
        return nil
    }
    
    func signInAnonymously() async throws -> AuthDataResult {
        try await Auth.auth().signInAnonymously()
    }
}
