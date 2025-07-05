//
//  CommentViweModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import FirebaseAuth
import FirebaseCore

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post
    
    init(post: Post){
        self.post = post
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let comment = Comment(postOwnerUid: post.ownerUid, commentText: commentText, postId: post.id, timestamp: Timestamp(), commentOwnerUid: uid)
        
        try await CommentService.uploadComment(comment, postId: post.id)
    }
}
