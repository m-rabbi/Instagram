//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/4/25.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
