//  /*
//
//  Project EchoAI
//  File: EchoViewBuilder.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.12.2024
//
//  */

import SwiftUI

struct EchoViewBuilder<TabbarView: View, OnboardingView: View>: View {
    var showTabBar: Bool = false
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView

    var body: some View {
        ZStack {
            if showTabBar {
                tabbarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {
    @State private var showTabBar: Bool = false

    var body: some View {
        EchoViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.blue
                        .ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.brown
                        .ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
