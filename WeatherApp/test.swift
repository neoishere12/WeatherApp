//
//  test.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//

import SwiftUI

struct test: View {
    @State private var posts: Posts?

    var body: some View {
        VStack {
            if let posts = posts {
                Text("Title: \(posts.title)")
                Text("Body: \(posts.body)")
            } else {
                Text("Loading...")
                    .onAppear {
                        fetchData()
                    }
            }
        }
    }

    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedPosts = try JSONDecoder().decode(Posts.self, from: data)
                DispatchQueue.main.async {
                    self.posts = decodedPosts
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    test()
}
