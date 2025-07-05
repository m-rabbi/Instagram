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
    private let service: CommentService
    
    init(post: Post){
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let comment = Comment(postOwnerUid: post.ownerUid, commentText: commentText, postId: post.id, timestamp: Timestamp(), commentOwnerUid: uid)
        
        try await service.uploadComment(comment)
    }
    
    @MainActor
    func fetchComments() async throws {
        self.comments = try await service.fetchComment()
        try await fetchUserDataForComment()
    }
    
    @MainActor
    private func fetchUserDataForComment() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
