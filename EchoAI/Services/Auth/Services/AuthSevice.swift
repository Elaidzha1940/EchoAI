//  /*
//
//  Project EchoAI
//  File: AuthSevice.swift
//  Created by: Elaidzha Shchukin
//  Date: 31.12.2024
//
//  */

import SwiftUI

protocol AuthSevice: Sendable {
    func addAuthenticatedUserListener(onListenerAttached: (any NSObjectProtocol) -> Void) -> AsyncStream<UserAuthInfo?>
    func getAuthenticatedUser() -> UserAuthInfo?
    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool)
    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool)
    func signOut() throws
    func deleteAccount() async throws
}
