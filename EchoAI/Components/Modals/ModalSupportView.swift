//  /*
//
//  Project EchoAI
//  File: ModalSupportView.swift
//  Created by: Elaidzha Shchukin
//  Date: 18.11.2024
//
//  */

import SwiftUI

struct ModalSupportView<Content: View>: View {
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .transition(AnyTransition.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
        }
        .animation(.bouncy, value: showModal)
        .zIndex(9999)
    }
}

extension View {
    func showModal(showModal: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(
                ModalSupportView(showModal: showModal) {
                    content()
                }
            )
    }
}

private struct PreviewView: View {
    @State private var showModal: Bool = false
    
    var body: some View {
        Button("Click Me") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showModal(showModal: $showModal) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.cyan)
                .padding(40)
                .padding(.vertical, 100)
                .onTapGesture {
                    showModal = false
                }
                .transition(.move(edge: .bottom))
        }
    }
}

#Preview {
    PreviewView()
}
