//
//  FetchData.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 28/01/23.
//

import Foundation
import SwiftUI

//FETCHING JSON DATA

struct Response: Codable {
     var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct FetchData: View {

    @State private var resultsList = [Result]()

    var body: some View {
        List(resultsList, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    
    func loadData() async
       {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else
        {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
            {
                resultsList = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }

}

