//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
