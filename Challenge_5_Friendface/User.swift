//
//  User.swift
//  Challenge_5_Friendface
//
//  Created by Daniel Freire on 1/20/24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
