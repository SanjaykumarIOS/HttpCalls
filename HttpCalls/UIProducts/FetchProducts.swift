////
////  FetchProducts.swift
////  HttpCalls
////
////  Created by SwiftAntMac2 on 03/02/23.
////
//
//import Foundation
//import SwiftUI
//
//var productData:[ProductListModel.ProductResults]?
//
//struct FetchProduct: View {
//
//    var productClassObj = GetProductData()
//
//    init() {
//        //productData = self.productClassObj.getData()
//    }
//
//    var body: some View {
//
//        NavigationView{
//
//            List{
//                ForEach(productData!, id: \.id) { item in
//                NavigationLink {
//                    ProductDataDetails(productsData:item)
//                } label: {
//                    ProductRow(productsData:item)
//                }
//
//            }
//            .navigationTitle("Products")
//            }
//        }
//    }
//}
//
//class GetProductData {
//
//    var apiManager = GetProductData()
//
//    func getData() -> [ProductListModel.ProductResults]? {
//        self.apiManager.retrieveProducts { (response) in
//            if let products = response.results, products.count > 0 {
//                productData = response.results
//            }
//        }fail: {
//            print("Failed to load data")
//        }
//        print("Data loaded successfully \(String(describing: productData?.count))")
//        return productData
//    }
//}
