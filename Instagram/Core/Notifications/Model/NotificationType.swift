//
//  NotificationType.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage : String {
        switch self {
        case .like:
            return "liked your post"
        case .comment:
            return "commented on your post"
        case .follow:
            return "started following you"
        }
    }
}
