//
//  PokemonAPIList.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 28/01/23.
//

import Foundation
import SwiftUI

struct PokemonList: View {
    
    @ObservedObject var networkingManager = PokemonNetworkManager()
    
    var body: some View {
        NavigationStack{
            List(networkingManager.results,id:\.name) { pokemon in
                Text(pokemon.name)
                    .font(.largeTitle)
                Text(pokemon.url)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct PokemonAPIList: Decodable {
    var results: [PokemonListEntry]
}

struct PokemonListEntry: Decodable {
    var name: String
    var url: String
}



class PokemonNetworkManager: ObservableObject {
  
   @Published var results = [PokemonListEntry]()
     
    init() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.results = pokemonList.results
            }
        }.resume()
    }
}
  
