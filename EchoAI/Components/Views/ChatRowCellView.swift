//  /*
//
//  Project EchoAI
//  File: ChatRowCellView.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.11.2024
//
//  */

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var headline: String? = "Nina"
    var subheadline: String? = "Hooo! Hooo! Hooo! Hooo!"
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary )
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("New")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .cornerRadius(6)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: UIColor.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            ChatRowCellView(headline: nil, hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }
    }
}
