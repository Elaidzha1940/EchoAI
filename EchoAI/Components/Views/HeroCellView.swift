//  /*
//
//  Project EchoAI
//  File: EchoAIApp.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.11.2024
//
//  */

import SwiftUI

struct HeroCellView: View {
    var title: String? = "This is some title"
    var subTitle: String? = "This is some subtitle that will go here"
    var imageName: String? = Constants.randomImage
    
    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading, content: {
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                if let subTitle {
                    Text(subTitle)
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.white)
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(colors: [
                    Color.black.opacity(0),
                    Color.black.opacity(0.2),
                    Color.black.opacity(0.4),
                ], startPoint: .top, endPoint: .bottom)
            )
        })
        .cornerRadius(16)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCellView()
                .frame(width: 300, height: 200)
            
            HeroCellView()
                .frame(width: 300, height: 400)
            
            HeroCellView()
                .frame(width: 200, height: 200)
            
            HeroCellView(imageName: nil)
                .frame(width: 300, height: 200)
            
            HeroCellView(title: nil)
                .frame(width: 300, height: 200)
            
            HeroCellView(subTitle: nil)
                .frame(width: 300, height: 200)
        }
        .frame(maxWidth: .infinity)
    }
}
