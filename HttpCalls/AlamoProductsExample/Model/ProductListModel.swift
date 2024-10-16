//
//  ProductsApi.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 02/02/23.
//

import Foundation
import SwiftUI

class ProductListModel: Decodable {
    let products: [ProductResults]
    let total: Int
    let skip: Int
    let limit: Int

    class ProductResults: Decodable {
        let id: Int
        let title: String
        let description: String
        let price: Double
        let discountPercentage: Double
        let rating: Double
        let stock: Int
        let brand: String?
        let category: String
        let minimumOrderQuantity: Int
        let reviews: [Review]?
        let thumbnail: URL
        let images: [URL]
        
        class Review: Decodable {
            let rating: Int?
            let comment: String?
            let date: String?
            let reviewerName: String?
            let reviewerEmail: String?
        }
    }
}


