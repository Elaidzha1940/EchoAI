//  /*
//
//  Project EchoAI
//  File: TabBarView.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.text.bubble.right.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
