//
//  CustomNavigationContainer.swift
//  TestCustomNavigation
//
//  Created by ARMBP on 7/24/24.
//

import SwiftUI

struct CustomNavigationContainer<Content: View>: View {
    @ObservedObject var model: NavigationModel
    let content: () -> Content
    
    var body: some View {
        ZStack {
            if model.viewStack.isEmpty {
                content()
                    .transition(.opacity)
            } else {
                ForEach(0..<model.viewStack.count, id: \.self) { index in
                    if index == self.model.viewStack.count - 1 {
                        self.model.viewStack[index]
                            .transition(self.transition(for: self.model.navigationType))
                    }
                }
            }
        }
        .animation(.easeInOut, value: UUID())
    }
    
    private func transition(for type: NavigationType) -> AnyTransition {
        switch type {
            case .push:
                return .move(edge: .trailing)
            case .present:
                return .opacity
            case .custom:
                return .scale(scale: 0.9)
        }
    }
}
