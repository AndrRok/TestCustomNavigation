//
//  DetailView.swift
//  TestCustomNavigation
//
//  Created by ARMBP on 7/24/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var navigationModel: NavigationModel
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(title)
                .font(.largeTitle)
            
            Button("Back") {
                navigationModel.pop()
            }
            .padding()
            
            Button("Back to Root") {
                navigationModel.popToRoot()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    DetailView(navigationModel: NavigationModel(), title: "Title")
}
