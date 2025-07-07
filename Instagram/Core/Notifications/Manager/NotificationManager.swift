//
//  NotificationManager.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Foundation

class NotificationManager {
    
    static let shared = NotificationManager()
    private let service = NotificationService()
    
    private init() {
        
    }
    
    
    func uploadLikeNotification(toUid uid: String, post: Post) async throws {
        try await  service.uploadNotification(toUid: uid, type: .like, post: post)
    }
    
    func uploadCommentNotification(toUid uid: String, post: Post) async throws {
        try await  service.uploadNotification(toUid: uid, type: .comment, post: post)

    }
    
    func uploadFollowNotification(toUid uid: String) async throws {
        try await  service.uploadNotification(toUid: uid, type: .follow)

    }
    
    func deleteLikeNotification(notificationOwnerUid: String, post: Post) async {
        do {
            try await service.deleteNotification(toId: notificationOwnerUid, type: .like, post: post)
        } catch {
            print("DEBUG: Error deleting like notification")
        }
    }
    
    func deleteFollowNotification(notificationOwnerUid: String) async {
        do {
            try await service.deleteNotification(toId: notificationOwnerUid, type: .follow)
        } catch {
            print("DEBUG: Error deleting follow notification")
        }
    }
}
