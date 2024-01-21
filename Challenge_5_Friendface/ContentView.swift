//
//  ContentView.swift
//  Challenge_5_Friendface
//
//  Created by Daniel Freire on 1/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        NavigationStack {
            UsersView(users: users)
            .navigationTitle("User List")
            .navigationDestination(for: User.self) { user in
                UserDetailsView(user: user)
            }
        }
        .onAppear(perform: {
            Task {
                do {
                    if !users.isEmpty { return }
                    try await fetchUsers()
                } catch {
                    print("error \(error.localizedDescription)")
                }
            }
        })
    }
    
    func fetchUsers() async throws {
        print("Fetching users")
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

        // Perform the asynchronous data task using URLSession
        let (data, response) = try await URLSession.shared.data(from: url)

        // Check if the HTTP response is successful (e.g., 200 OK)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response or status code", code: 0, userInfo: nil)
        }

        // Decode the data into a User struct
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decodedUsers = try decoder.decode([User].self, from: data)
        users = decodedUsers
        print(1, users.count)
    }
}

#Preview {
    ContentView()
}
