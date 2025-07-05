//
//  CommentService.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import FirebaseFirestore


struct CommentService {
    
    let postId: String
    
    func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await Firestore.firestore().collection("posts").document(postId).collection("post-comments").addDocument(data: commentData)
    }
    
    func fetchComment() async throws -> [Comment] {
        let snapshot = try await Firestore.firestore().collection("posts").document(postId).collection("post-comments").getDocuments()
        
        return snapshot.documents.compactMap( { try? $0.data(as: Comment.self) } )
    }
}
