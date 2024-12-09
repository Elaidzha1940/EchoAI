//  /*
//
//  Project EchoAI
//  File: ExploreView.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

struct ExploreView: View {
    let avatar = AvatarModel.mock
    
    var body: some View {
        NavigationStack {
            HeroCellView(
                title: avatar.name,
                subTitle: avatar.characterDescription,
                imageName: avatar.profileImageName)
            
            Text("Explore")
                .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
