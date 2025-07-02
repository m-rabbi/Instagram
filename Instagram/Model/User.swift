//
//  User.swift
//  Instagram
//
//  Created by Md Rabbi on 7/1/25.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static let MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            username: "batman",
            profileImageUrl: "batman-2",
            fullname: "Bruce Wayne",
            bio: "👤 Billionaire by day, vigilante by night. Protecting Gotham one shadow at a time.",
            email: "batman@wayneindustries.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "venom",
            profileImageUrl: "venom-2",
            fullname: "Eddie Brock",
            bio: "🕷️ Not your friendly neighborhood symbiote. We are Venom.",
            email: "eddie@venomverse.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "ironman",
            profileImageUrl: "ironman",
            fullname: "Tony Stark",
            bio: "🧠 Inventor. 💰 Billionaire. 💥 Philanthropist. I am Iron Man.",
            email: "tony@starkindustries.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "blackpanther",
            profileImageUrl: "black-panther",
            fullname: "T'Challa",
            bio: "🖤 King of Wakanda. Wakanda forever.",
            email: "tchalla@wakanda.gov"
        ),
        .init(
            id: UUID().uuidString,
            username: "spiderman",
            profileImageUrl: "spiderman",
            fullname: "Peter Parker",
            bio: "📸 Photographer. 🕸️ Web developer. Just your friendly neighborhood Spider-Man.",
            email: "peter@dailybugle.com"
        )
    ]
}
