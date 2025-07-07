//
//  DeveloperPreview.swift
//  Instagram
//
//  Created by Md Rabbi on 7/5/25.
//

import SwiftUI
import FirebaseCore

//extension PreviewProvider {
//    static var dev: DeveloperPreview {
//        return DeveloperPreview.shared
//    }
//}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(commentId: "123", postOwnerUid: "232", commentText: "Test Comment", postId: "323", timestamp: Timestamp(), commentOwnerUid: "4242")
    
    let notifications: [Notification] = [
        Notification(
                id: UUID().uuidString,
                postId: Post.MOCK_POSTS[0].id,
                timestamp: Timestamp(date: Date()),
                notificationSenderUid: User.MOCK_USERS[1].id,
                type: .like,
                post: Post.MOCK_POSTS[0],
                user: User.MOCK_USERS[1]
            ),
            Notification(
                id: UUID().uuidString,
                postId: Post.MOCK_POSTS[1].id,
                timestamp: Timestamp(date: Date().addingTimeInterval(-3600)),
                notificationSenderUid: User.MOCK_USERS[2].id,
                type: .comment,
                post: Post.MOCK_POSTS[1],
                user: User.MOCK_USERS[2]
            ),
            Notification(
                id: UUID().uuidString,
                postId: nil,
                timestamp: Timestamp(date: Date().addingTimeInterval(-86400)),
                notificationSenderUid: User.MOCK_USERS[3].id,
                type: .follow,
                post: nil,
                user: User.MOCK_USERS[3]
            )
    ]
    
}
