//
//  AlamoGetProducts.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 03/02/23.
//

import Foundation
import SwiftUI
import Alamofire

struct ProductsApi: Decodable {
    var products: [ProductListModel.ProductResults]
}

struct AlamofireProductGetRequest: View {
    
    let url = "https://dummyjson.com/products"
    
    @State private var items = [ProductListModel.ProductResults]()
    
    let colors: [Color] = [
        Color(red: 1.0, green: 0.9, blue: 0.9),
        Color(red: 0.9, green: 0.95, blue: 1.0),
        Color(red: 0.9, green: 1.0, blue: 0.9),
        Color(red: 1.0, green: 1.0, blue: 0.9),
        Color(red: 0.95, green: 0.9, blue: 1.0),
        Color(red: 1.0, green: 0.95, blue: 0.9),
        Color(red: 1.0, green: 0.9, blue: 0.95),
        Color(red: 1.0, green: 0.9, blue: 0.8),
        Color(red: 0.8, green: 0.9, blue: 1.0),
        Color(red: 1.0, green: 1.0, blue: 0.8),
        Color(red: 0.9, green: 1.0, blue: 0.8),
        Color(red: 0.9, green: 0.8, blue: 1.0),
        Color(red: 1.0, green: 0.9, blue: 0.7)
    ]
    
    // Define the grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        NavigationLink {
                            ProductDataDetails(productsData: item)
                        } label: {
                            ProductRow(productsData: item)
                                .frame(height: 270)
                                .background(colors[index % colors.count])
                                .cornerRadius(17)
                                .shadow(radius: 3)
                                .padding(5)
                        }
                    }
                }
                .padding()
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.automatic)
                .bold()
            }
            .onAppear {
                // Alamofire request to fetch products
                //                Session.default.request(url).responseDecodable(of: ProductsApi.self) { response in
                //                    switch response.result {
                //                    case .success(let products):
                //                        self.items = products.products
                //                        print(products)
                //                    case .failure(let error):
                //                        print(error)
                //                    }
                //                }
                
                fetchProduct()
            }
        }
    }
    
    func fetchProduct() {
        // Create the URL
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        // Create a data task to fetch the products
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching products: \(error)")
                return
            }
            
            // Check for valid response and data
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // Decode the JSON data into your model
                let products = try JSONDecoder().decode(ProductsApi.self, from: data)
                DispatchQueue.main.async {
                    self.items = products.products
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        // Start the data task
        task.resume()
        
    }
}



