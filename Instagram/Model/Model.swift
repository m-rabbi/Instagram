//
//  Model.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
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
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Suit upgrade complete. Ready for battle!",
            likes: 310,
            imageUrl: "ironman",
            timestamp: Date().addingTimeInterval(-86400), // 1 day ago
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "With great power comes great responsibility 🕷️",
            likes: 420,
            imageUrl: "spiderman",
            timestamp: Date().addingTimeInterval(-172800), // 2 days ago
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Wakanda forever ✊🏿",
            likes: 275,
            imageUrl: "black-panther",
            timestamp: Date().addingTimeInterval(-259200), // 3 days ago
            user: User.MOCK_USERS[3]
        )
    ]
}

