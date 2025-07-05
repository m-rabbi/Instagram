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
    
}
