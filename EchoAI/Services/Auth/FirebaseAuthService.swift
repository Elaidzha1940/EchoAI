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
import SignInAppleAsync

extension EnvironmentValues {
    @Entry var authService: FirebaseAuthService = FirebaseAuthService()
}

struct FirebaseAuthService {
    
    func getAuthenticatedUser() -> UserAuthInfo? {
        if let user = Auth.auth().currentUser {
            return UserAuthInfo(user: user)
        }
        return nil
    }
    
    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let result = try await Auth.auth().signInAnonymously()
        return result.asAuthInfo
    }
    
    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let helper = await SignInWithAppleHelper()
        let response = try await helper.signIn()
        
        let crdential = OAuthProvider.credential(
            providerID: AuthProviderID.apple,
            idToken: response.token,
            rawNonce: response.nonce)
        
        // Try to link to existing anonymous account
        if let user = Auth.auth().currentUser, user.isAnonymous, let result = try? await user.link(with: crdential) {
            return result.asAuthInfo
        }
        
        // Otherwise sign in to new account
        let result = try await Auth.auth().signIn(with: crdential)
        return result.asAuthInfo
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.userNotFound
        }
        
        try await  user.delete()
    }
    
    enum AuthError: LocalizedError {
        case userNotFound
        
        var errorDescription: String? {
            switch self {
            case .userNotFound:
                return "Currenet authenticated user not found."
            }
        }
    }
}

extension AuthDataResult {
    
    var asAuthInfo: (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo(user: user)
        let isNewUser = additionalUserInfo?.isNewUser ?? true
        return (user, isNewUser)
    }
}
