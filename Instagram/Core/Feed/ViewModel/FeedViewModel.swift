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
    
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = snapshot.documents.compactMap( { try? $0.data(as: Post.self) })
    }
}
