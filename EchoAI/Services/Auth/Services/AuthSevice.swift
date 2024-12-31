//  /*
//
//  Project EchoAI
//  File: AuthSevice.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.11.2024
//
//  */

import SwiftUI

extension EnvironmentValues {
    @Entry var authService: AuthSevice = MockAuthService()
}

protocol AuthSevice: Sendable {
    func getAuthenticatedUser() -> UserAuthInfo?
    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool)
    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool)
    func signOut() throws
    func deleteAccount() async throws
}
