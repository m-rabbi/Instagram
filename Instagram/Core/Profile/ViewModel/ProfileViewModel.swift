//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/6/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

// MARK: - Following
extension ProfileViewModel {
    func follow() {
        user.isFollowed = true
    }
    
    func unfollow() {
        user.isFollowed = false
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
