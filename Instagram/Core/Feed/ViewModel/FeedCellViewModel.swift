//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() async throws {
        post.didLike = true
    }
    
    func unlike() async throws {
        post.didLike = false
    }
}
