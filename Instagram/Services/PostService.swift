//
//  PostService.swift
//  Instagram
//
//  Created by Md Rabbi on 7/4/25.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = snapshot.documents.compactMap( { try? $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            posts[i].user = try await UserService.fetchUser(withUid: ownerUid)
            
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField( "ownerUid", isEqualTo: uid ).getDocuments()
        return snapshot.documents.compactMap( { try? $0.data(as: Post.self) })
    }
    
}


