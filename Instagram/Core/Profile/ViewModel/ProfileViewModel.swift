//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/6/25.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
}

// MARK: - Following
extension ProfileViewModel {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        Task {
            self.user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        }
    }
}
