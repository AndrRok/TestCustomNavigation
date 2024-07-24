//
//  ContentView.swift
//  TestCustomNavigation
//
//  Created by ARMBP on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationModel = NavigationModel()
    
    var body: some View {
        CustomNavigationContainer(model: navigationModel) {
            VStack {
                Text("Main View")
                    .font(.largeTitle)
                
                Button("Push View") {
                    navigationModel.push(DetailView(navigationModel: navigationModel, title: "Pushed View"))
                }
                .padding()
                
                Button("Present View") {
                    navigationModel.present(DetailView(navigationModel: navigationModel, title: "Presented View"))
                }
                .padding()
                
                Button("Custom View") {
                    navigationModel.custom(DetailView(navigationModel: navigationModel, title: "Custom View"))
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
