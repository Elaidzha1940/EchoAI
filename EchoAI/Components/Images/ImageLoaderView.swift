//  /*
//
//  Project EchoAI
//  File: EchoAIApp.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.11.2024
//
//  */

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    var forceTransitionAnimation: Bool = false
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
        ifSatisfiedCondition(forceTransitionAnimation) { content in
            content
                .drawingGroup()
            
        }
    }
}

extension View {
    @ViewBuilder
    func ifSatisfiedCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            self // with modifier
        } else {
            
        }
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
        .anyButton(.highlight) {
            
        }
}
