//
//  ProductRow.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 02/02/23.
//

import Foundation
import SwiftUI

//struct ProductRow: View {
//    
//    var productsData: ProductListModel.ProductResults
//    
//    var body: some View {
//        
//            NavigationStack {
//                
//                ScrollView {
//                
//                HStack {
//                    AsyncImage(url: (productsData.thumbnail)) { image in
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .cornerRadius(8)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth:120, maxHeight: 170)
//                            .font(.system(size: 20))
//                        
//                    } placeholder: {
//                        Image(systemName:"eye")
//                    }
//                    .padding()
//                    
//                    VStack(alignment: .leading, spacing: 5) {
//                        
//                        Text(productsData.title)
//                        
//                        Text("$\(productsData.price)")
//                            .fontDesign(.monospaced )
//                        
//                        HStack {
//                            ForEach (1...4, id:\.self) {_ in
//                                Image (systemName: "star.fill")
//                                    .font (.system(size: 7))
//                                    .foregroundColor (.blue)
//                                    .scaledToFit()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//

import SDWebImage
import SDWebImageSwiftUI

struct ProductRow: View {
    
    var productsData: ProductListModel.ProductResults
    
    var body: some View {
        VStack {
            
            VStack {
                WebImage(url: URL(string: "\(productsData.thumbnail)"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
//                AsyncImage(url: productsData.thumbnail) { image in
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                } placeholder: {
//                    Image(systemName: "photo")
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(.gray.opacity(0.8))
//                }
            }
            .padding(15)
            
            VStack(spacing:5) {
                
                Text("\(productsData.category)")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment:.leading)
                
                Text(productsData.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity,alignment:.leading)
                
                Text("$\(productsData.price, specifier: "%.2f")")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment:.leading)
                    .padding(.top,5)
                
            }
            .frame(maxWidth: .infinity,alignment:.leading)
            .padding(.horizontal,10)
            
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.top)
    }
}




