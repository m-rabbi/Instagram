//
//  Notification.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Firebase

struct Notification: Identifiable, Codable {
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
    
}
