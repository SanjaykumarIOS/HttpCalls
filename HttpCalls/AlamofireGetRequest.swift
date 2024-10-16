//
//  AlamofireGetRequest.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 31/01/23.
//

import Foundation
import SwiftUI
import Alamofire




struct UserApi: Decodable {
    var users: [UsersList]
}

struct UsersList: Decodable {
let id: Int
let firstName: String
let lastName: String
let age: Int
}

struct AlamofireGetRequest: View {
    
    let url = "https://dummyjson.com/users"
    
    @State private var items = [UsersList]()
    
    var body: some View{
        NavigationStack{
            List(items, id: \.id) { item in
                Text("\(item.id)")
                HStack{
                    Text(item.firstName)
                    Text(item.lastName)
                }
            }
            .onAppear{
                let decoder: JSONDecoder = {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    return decoder
                }()
                
                Session.default.request(url).responseDecodable(of: UserApi.self) { response in
                    
                    switch response.result {
                    case .success(let users):
                        self.items = users.users
                        print(users)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
