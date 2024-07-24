//
//  NavigationModel.swift
//  TestCustomNavigation
//
//  Created by ARMBP on 7/24/24.
//

import SwiftUI

enum NavigationType {
    case push
    case present
    case custom
}

class NavigationModel: ObservableObject {
    @Published var viewStack: [AnyView] = []
    @Published var navigationType: NavigationType = .push

    func push<ViewType: View>(_ view: ViewType) {
        navigationType = .push
        viewStack.append(AnyView(view))
    }

    func present<ViewType: View>(_ view: ViewType) {
        navigationType = .present
        viewStack.append(AnyView(view))
    }

    func custom<ViewType: View>(_ view: ViewType) {
        navigationType = .custom
        viewStack.append(AnyView(view))
    }

    func pop() {
        if !viewStack.isEmpty {
            viewStack.removeLast()
        }
    }

    func popToRoot() {
        viewStack.removeAll()
    }
}
