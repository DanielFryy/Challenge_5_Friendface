//
//  Friend.swift
//  Challenge_5_Friendface
//
//  Created by Daniel Freire on 1/20/24.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}
