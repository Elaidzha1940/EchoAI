//  /*
//
//  Project EchoAI
//  File: ProfileModalView.swift
//  Created by: Elaidzha Shchukin
//  Date: 18.11.2024
//
//  */

import SwiftUI

struct ProfileModalView: View {
    var imageName: String? = Constants.randomImage
    var title: String? = "Black Coffee"
    var subtitle: String? = "Man"
    var headline: String? = "A man in the club."
    var onXMarkPressed: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(
                    urlString: imageName,
                    forceTransitionAnimation: false
                )
                    .aspectRatio(1, contentMode: .fit)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(.black)
                .padding(4)
                .tappableBackground()
                .anyButton {
                    onXMarkPressed()
                }
                .padding(8)
            
            , alignment: .topTrailing)
    }
}

#Preview("Modal w/ Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView()
            .padding(40)
    }
}

#Preview("Modal w/out Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
