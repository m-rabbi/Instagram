//
//  CommentService.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import FirebaseFirestore


struct CommentService {
    static func uploadComment(_ comment: Comment, postId: String) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await Firestore.firestore().collection("posts").document(postId).collection("post-comments").addDocument(data: commentData)
    }
}
