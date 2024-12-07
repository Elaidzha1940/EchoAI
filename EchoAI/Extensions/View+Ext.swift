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
}
