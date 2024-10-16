//
//  AlamofireView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 31/01/23.
//

import Foundation
import SwiftUI
import Alamofire

struct ProductApi: Decodable {
    var products: [ProductList]
}

struct ProductList: Decodable {
    let id: String
    let title: String
    let description: String
    let price:String
}

struct AlamofireView: View {
    
    @State var items = [ProductList]()
    let url = "https://dummyjson.com/products"
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items, id: \.id) { item in
                    Text(item.title)
                    Text(item.description)
                }
            }
            .onAppear{
                    let decoder: JSONDecoder = {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    return decoder
                }()
                
//                AF.request("https://dummyjson.com/products/1")
//                    .validate(statusCode: 200..<300)
//                    .responseDecodable(of: ProductsApi.self)
                
                Session.default.request(url).responseDecodable(of: ProductApi.self)
                { response in
                        switch response.result {
                        case .success(let items):
                            print("items", items)
                        case .failure(let error):
                            print("error")
                    }
                }
            }
        }
    }
}
