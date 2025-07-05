//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() async throws {
 
        do {
            let postCopy = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(postCopy)

        } catch {
            post.didLike = false
            post.likes -= 1
        }
    }
    
    func unlike() async throws {
        do {
            let postCopy = post
            post.didLike = false
            post.likes -= 1
            try await PostService.likePost(postCopy)

        } catch {
            post.didLike = true
            post.likes += 1
        }
    }
}
