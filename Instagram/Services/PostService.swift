//
//  PostService.swift
//  Instagram
//
//  Created by Md Rabbi on 7/4/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

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

// MARK: - Likes

extension PostService {
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).setData([ : ])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).delete()
    }
}


