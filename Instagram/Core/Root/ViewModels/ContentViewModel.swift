//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] UserSession in
            self?.userSession = UserSession
        }.store(in: &cancellables)
    }
}
