//
//  Model.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import Foundation
import Firebase

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var didLike: Bool? = false
    
}

extension Post {
    
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com/v0/b/instagram-b4537.firebasestorage.app/o/profile_images%2F2021B8B6-9BE1-451A-8735-991CAE5238FB?alt=media&token=b94b70f0-1841-40ba-830f-6edbb741b7b4"
    
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Gotham needs me. No days off.",
            likes: 142,
            imageUrl: MOCK_IMAGE_URL,
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Suit upgrade complete. Ready for battle!",
            likes: 310,
            imageUrl: "ironman",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "With great power comes great responsibility 🕷️",
            likes: 420,
            imageUrl: "spiderman",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Wakanda forever ✊🏿",
            likes: 275,
            imageUrl: "black-panther",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "We are Venom.",
            likes: 334,
            imageUrl: "venom-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hungry for justice... and maybe a snack 🕷️",
            likes: 289,
            imageUrl: "venom-2",
            timestamp: Timestamp(), 
            user: User.MOCK_USERS[1]
        )

    ]
}

