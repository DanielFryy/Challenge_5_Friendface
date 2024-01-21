//
//  UserDetailsView.swift
//  Challenge_5_Friendface
//
//  Created by Daniel Freire on 1/20/24.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Details") {
                Text("Name: \(user.name)")
                Text("Email: \(user.email)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Registered: \(formattedDate(user.registered))")
            }
            
            Section("Tags") {
                ForEach(Array(Set(user.tags)), id: \.self) { tag in
                    Text(tag)
                }
            }
            
            Section("Friends") {
                List(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Helper method to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    let user = User(id: UUID(), isActive: true, name: "Vivi", age: 43, company: "Fitness Group", email: "vivi@gmail.com", address: "", about: "I'm a fisioterapist", registered: .now, tags: ["friendly", "cute"], friends: [])
    return UserDetailsView(user: user)
}
