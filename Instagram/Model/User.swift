//
//  User.swift
//  Instagram
//
//  Created by Md Rabbi on 7/1/25.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isFollowed: Bool? = false
    
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

struct UserStats: Codable, Hashable {
    var followingCount: Int
    var followersCount: Int
    var postsCount: Int
}

extension User {
    static let MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            username: "batman",
            profileImageUrl: nil,
            fullname: "Bruce Wayne",
            bio: "👤 Billionaire by day, vigilante by night. Protecting Gotham one shadow at a time.",
            email: "batman@wayneindustries.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "venom",
            profileImageUrl:nil,
            fullname: "Eddie Brock",
            bio: "🕷️ Not your friendly neighborhood symbiote. We are Venom.",
            email: "eddie@venomverse.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "ironman",
            profileImageUrl: nil,
            fullname: "Tony Stark",
            bio: "Inventor. Billionaire. Philanthropist. I am Iron Man.",
            email: "tony@starkindustries.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "blackpanther",
            profileImageUrl: nil,
            fullname: "T'Challa",
            bio: "🖤 King of Wakanda. Wakanda forever.",
            email: "tchalla@wakanda.gov"
        ),
        .init(
            id: UUID().uuidString,
            username: "spiderman",
            profileImageUrl: nil,
            fullname: "Peter Parker",
            bio: "📸 Photographer. 🕸️ Web developer. Just your friendly neighborhood Spider-Man.",
            email: "peter@dailybugle.com"
        )
    ]
}
