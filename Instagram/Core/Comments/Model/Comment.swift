//
//  Comment.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import Foundation
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerUid: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
    
}
