//
//  ProductList.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 02/02/23.
//

import Foundation
import SwiftUI

//var productData:[ProductListModel.ProductResults]?

struct ProductList: View {

    //var productClassObj = GetProductData()
    
    init() {
        //productData = self.productClassObj.getData()
    }
    
    var body: some View {
        
        VStack{
            
        }
        
        NavigationView{

            List{
                ForEach(productData!, id: \.id) { item in
                NavigationLink {
                    ProductDataDetails(productsData:item)
                } label: {
                    ProductRow(productsData:item)
                }

            }
            .navigationTitle("Products")
            }
        }
    }
}


