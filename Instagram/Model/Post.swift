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
    
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Gotham needs me. No days off.",
            likes: 142,
            imageUrl: "batman-2",
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

