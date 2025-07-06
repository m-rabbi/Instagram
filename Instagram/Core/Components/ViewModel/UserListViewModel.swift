//
//  UserListViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/6/25.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        print("DEBUG: did init user list view model")
    }
    

    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("DEBUG: failed to fetch users: \(error.localizedDescription)")
        }
    }
}
