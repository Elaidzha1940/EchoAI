//  /*
//
//  Project EchoAI
//  File: View+Ext.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2024
//
//  */

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent.gradient)
            .cornerRadius(16)
    }
    
    // MARK: - badgeButton
    func badgeButton() -> some View {
        self
            .font(.caption)
            .bold()
            .foregroundStyle(Color.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.blue)
            .cornerRadius(6)
    }
    
    // MARK: - tappableBackground
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
    
    // MARK: - removeListRowFormatting
    func removeListRowFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    // MARK: - addingGradientBAckgroundForText
    func addingGradientBAckgroundForText() -> some View {
        background(
            LinearGradient(colors: [
                Color.black.opacity(0),
                Color.black.opacity(0.2),
                Color.black.opacity(0.4)
            ], startPoint: .top, endPoint: .bottom)
        )
    }
    
    @ViewBuilder
    func ifSatisfiedCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self) // with modifier
        } else {
            self
        }
    }
}
