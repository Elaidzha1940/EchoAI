//  /*
//
//  Project EchoAI
//  File: EchoState.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

@Observable
class EchoState {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

extension UserDefaults {
    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }
    
    static var showTabBarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
    }
}
