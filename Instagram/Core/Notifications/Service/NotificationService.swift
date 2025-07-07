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
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await FirebaseConstants.UserNotificationCollection(uid: currentUid).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Notification.self) })
    }
    
    func uploadNotification(toUid uid : String, type: NotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        let ref = FirebaseConstants.UserNotificationCollection(uid: uid).document()
        
        let notification = Notification(id: ref.documentID, postId: post?.id, timestamp: Timestamp(), notificationSenderUid: currentUid, type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        try await ref.setData(notificationData)
    }
    
    func deleteNotification(toId uid: String, type: NotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        
        let snapshot = try await FirebaseConstants.UserNotificationCollection(uid: uid).whereField("notificationSenderUid", isEqualTo: currentUid).getDocuments()
        
        let notifications = snapshot.documents.compactMap( { try? $0.data(as: Notification.self) } )
        
        let filteredByType = notifications.filter({ $0.type == type })
        guard let notificationToDelete = filteredByType.first(where: { $0.postId == post?.id }) else { return }
        
        try await FirebaseConstants.UserNotificationCollection(uid: uid).document(notificationToDelete.id).delete()
    }
}
