//  /*
//
//  Project EchoAI
//  File: UserManager.swift
//  Created by: Elaidzha Shchukin
//  Date: 02.02.2025
//
//  */

import SwiftUI

protocol UserService: Sendable {
    func saveUser(user: UserModel) async throws
    func streamUser(userId: String, onListenerConfigured: @escaping (ListenerRegistration) -> Void) -> AsyncThrowingStream<UserModel, Error>
}

import FirebaseFirestore
import SwiftfulFirestore

struct FirebaseUserService: UserService {
    var colletion: CollectionReference {
        Firestore.firestore().collection("users")
    }
    
    func saveUser(user: UserModel) async throws {
        try colletion .document(user.userId).setData(from: user, merge: true)
    }
    
    func streamUser(userId: String, onListenerConfigured: @escaping (ListenerRegistration) -> Void) -> AsyncThrowingStream<UserModel, Error> {
        colletion.streamDocument(id: userId, onListenerConfigured: onListenerConfigured)
    }
    
    func deleteUser(userId: String) async throws {
        try await colletion.document(userId).delete()
    }
}

@MainActor
@Observable

class UserManager {
    
    private let service: UserService
    private(set) var currentUser: UserModel?
    private var currentUserListener: ListenerRegistration?
    
    init(service: UserService) {
        self.service = service
        self.currentUser = nil
    }
    
    func logIn(auth: UserAuthInfo, isNewUser: Bool) async throws {
        let creationVersion = isNewUser ? Utilities.appVersion : nil
        let user = UserModel(auth: auth, creationVersion: creationVersion)
        try await service.saveUser(user: user)
        addCurrentUserListener(userId: auth.uid)
    }
    
    private func addCurrentUserListener(userId: String) {
        currentUserListener?.remove()
        
        Task {
            do {
                for try await value in service.streamUser(userId: userId, onListenerConfigured: { listener in
                    self.currentUserListener = listener
                }) {
                    self.currentUser = value
                    print("Seccessfully listened to user: \(value.userId)")
                }
            } catch {
                print("Error attaching user listener: \(error)")
            }
        }
    }
    
    func signOut() {
        currentUserListener?.remove()
        currentUserListener = nil
        currentUser = nil
    }
    
    func deleteCurrentUser() {
        
    }
}
