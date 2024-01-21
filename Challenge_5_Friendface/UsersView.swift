//
//  UsersView.swift
//  Challenge_5_Friendface
//
//  Created by Daniel Freire on 1/20/24.
//

import SwiftUI

struct UsersView: View {
    var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Text("•")
                            .font(.title)
                            .foregroundStyle(user.isActive ? .green : .red)
                        Text(user.name)
                    }
                }
            }
        }
    }
}

#Preview {
    UsersView(users: [])
}
