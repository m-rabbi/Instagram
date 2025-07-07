//
//  Constants.swift
//  Instagram
//
//  Created by Md Rabbi on 7/6/25.
//

import Firebase

struct  FirebaseConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
    
    static let FollowersCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    
    static let NotificationCollection = Root.collection("notifications")
    
    static func UserNotificationCollection(uid: String) -> CollectionReference {
        return NotificationCollection.document(uid).collection("user-notifications")
    }
    
}
