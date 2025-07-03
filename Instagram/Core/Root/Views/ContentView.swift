//
//  ContentView.swift
//  Instagram
//
//  Created by Md Rabbi on 6/30/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)

            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
