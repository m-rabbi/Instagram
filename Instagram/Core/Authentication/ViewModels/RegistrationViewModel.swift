//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
    
}
