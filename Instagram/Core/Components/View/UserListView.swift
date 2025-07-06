//
//  UserListView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/6/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var searchText = ""
    
    private let config: UserListConfig
    
    init(config: UserListConfig) {
        self.config = config
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        UserRowView(user: user)
                    }
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search...")
        }
        .task {
            await viewModel.fetchUsers(forConfig: config)
        }
    }
}

#Preview {
    UserListView(config: .explore)
}
