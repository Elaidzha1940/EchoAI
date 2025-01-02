//  /*
//
//  Project EchoAI
//  File: UserManager.swift
//  Created by: Elaidzha Shchukin
//  Date: 02.02.2025
//
//  */

import SwiftUI

protocol UserService {
    
}

@MainActor
@Observable
class UserManager {
    
    private let service: UserService
    private(set) var currentUser: UserModel?
    
    init(service: UserService) {
        self.service = service
        self.currentUser = nil
    }
    
    func logIn(auth: UserAuthInfo, isNewUser: Bool) async throws {
        
    }
}
