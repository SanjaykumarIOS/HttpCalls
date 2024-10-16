//
//  CheckOutView.swift
//  HttpCalls
//
//  Created by SANJAY  on 25/09/24.
//

import SwiftUI

struct BuyNowView: View {
    var product: ProductListModel.ProductResults
    var quantity: Int
    
    @State private var showConfirmation = false

    var body: some View {
        VStack {
            Text("Checkout")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("You are purchasing \(quantity) x \(product.title)")
                .font(.title2)
                .padding()

            Button(action: {
                print("Processing payment for \(quantity) of \(product.title)")
                showConfirmation = true
            }) {
                Text("Confirm Purchase")
                    .font(.system(size: 21))
                    .bold()
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 5)
            }
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("Order Placed"), message: Text("Your order has been placed successfully!"), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Checkout")
    }
}


