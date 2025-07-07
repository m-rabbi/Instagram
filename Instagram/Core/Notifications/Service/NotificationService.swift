//
//  NotificationService.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class NotificationService {
    func fetchNotification() async throws -> [Notification] {
        return DeveloperPreview.shared.notifications
    }
    
    func uploadNotification(toUid uid : String, type: NotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        let ref = FirebaseConstants.NotificationCollection.document(uid).collection("user-notifcations").document()
        
        let notification = Notification(id: ref.documentID, postId: post?.id, timestamp: Timestamp(), notificationSenderUid: currentUid, type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        try await ref.setData(notificationData)
    }
    
    func deleteNotification(toId uid: String, type: NotificationType, post: Post? = nil) async throws {
        
    }
}
