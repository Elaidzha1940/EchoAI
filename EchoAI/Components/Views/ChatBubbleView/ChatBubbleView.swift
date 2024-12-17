//  /*
//
//  Project EchoAI
//  File: EchoAIApp.swift
//  Created by: Elaidzha Shchukin
//  Date: 17.11.2024
//
//  */

import SwiftUI

struct ChatBubbleView: View {
    var text: String = "This is a text."
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?
    
    let offset: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: 14)
            }
            
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            ChatBubbleView(text: "Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo.")
            
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil)
            
            ChatBubbleView(
                text: "Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo, Hoo.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil)
        }
        .padding(8)
    }
}
