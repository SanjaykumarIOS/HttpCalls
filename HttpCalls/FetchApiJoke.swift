//
//  FetchJokeApi.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 31/01/23.
//

import Foundation
import SwiftUI

struct Joke: Codable{
    let value: String
}

struct FetchApiJoke: View {
    
    @State private var joke: String = ""
    
    var body: some View{
        
        NavigationStack{
            
            Text(joke)
                .bold()
                .italic()
                .padding(50)
            
            Button {
                Task {
                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                    
                    let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
                    
                    joke = decodedResponse?.value ?? ""
                }
            }
        label: {
                Text ("Click to fetch a joke")
                    .bold()
                    .frame(width: 250, height: 40)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
