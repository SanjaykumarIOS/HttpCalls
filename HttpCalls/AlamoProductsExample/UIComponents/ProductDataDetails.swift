//
//  ProductDataDetails.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 02/02/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI


struct ProductDataDetails: View {
    
    var productsData:ProductListModel.ProductResults
    
    @EnvironmentObject var cart: Cart
    @State private var isProductInCart = false
    
    @State private var onTabLike = false
    @State private var isShowingShareSheet = false
    
    @State private var showCheckout = false
    
    @State private var quantity: Int = 1
    
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
       
    
    // Function to get background color based on product ID
    func backgroundColor(for id: Int) -> Color {
        // Use modulo with (id - 1) to cycle through colors starting from 1
        return colors[(id - 1) % colors.count]
    }
    
    var body: some View {
        
        ZStack {
            backgroundColor(for: productsData.id)
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    TabView {
                        ForEach(productsData.images.indices, id: \.self) { item in
                            WebImage(url: productsData.images[item])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350, height: 200)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: productsData.images.count > 1 ? .always : .never))
                    .frame(height: 200)
                    
                }
                .padding()
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            
                            HStack(alignment:.top) {
                                Text("\(productsData.title)")
                                    .bold()
                                    .font(.system(size: 22, weight: .bold))
                                    .multilineTextAlignment(.leading)
                                
                               Spacer()
                                
                                VStack(alignment:.leading) {
                                    Text("$\(productsData.price, specifier: "%.2f")")
                                        .font(.system(size: 23,weight: .bold))
                                        .fontDesign(.monospaced)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.gray)
                                        .strikethrough()
                                    
                                    let discountAmount = productsData.price * (productsData.discountPercentage / 100)
                                    
                                    let finalPrice = productsData.price - discountAmount
                                    
                                    Text("$\(finalPrice, specifier: "%.2f")")
                                        .font(.system(size: 19,weight: .bold))
                                        .fontDesign(.monospaced)
                                        .foregroundColor(.black) +
                                    Text("(\(productsData.discountPercentage, specifier: "%.2f")%)")
                                        .font(.system(size: 16,weight: .medium))
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.vertical,8)
                            .padding(.horizontal)
                            .padding(.top)
                            
                            Text("\(productsData.description)")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black.opacity(0.5))
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal,10)
                                .padding(.top,12)
                            
                            HStack(alignment:.center) {
                                
                                Button(action: {
                                    if cart.items.contains(where: { $0.id == productsData.id }) {
                                        isProductInCart = true // Product already in cart
                                    } else {
                                        cart.addToCart(product: productsData, quantity: quantity) // Add product to cart
                                    }
                                }) {
                                    Text("Add to cart")
                                        .font(.system(size: 21))
                                        .bold()
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                }
                                .alert(isPresented: $isProductInCart) {
                                    Alert(
                                        title: Text("Already in Cart"),
                                        message: Text("This product is already in your cart."),
                                        dismissButton: .default(Text("OK"))
                                        
                                    )
                                }
                                
                                Spacer()
                                                               
                                ZStack {
                                    HStack {
                                        
                                        Button(action: {
                                            if quantity > 1 {
                                                quantity -= 1
                                            }
                                        }) {
                                            Image(systemName: "minus")
                                                .bold()
                                                .font(.system(size: 17))
                                                .foregroundColor(.black)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            quantity += 1
                                        }) {
                                            Image(systemName: "plus")
                                                .bold()
                                                .font(.system(size: 17))
                                                .foregroundColor(.black)
                                        }
                                        
                                    }
                                    .padding(.horizontal,10)
                                    
                                    Text("\(quantity)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .frame(width: 35, height: 37 ,alignment: .center)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(radius: 1)
                                }
                                .frame(width: 120, height: 40)
                                .background(backgroundColor(for: productsData.id))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundColor(for: productsData.id))
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                            .padding(.top,12)
                        }
                        
                        NavigationLink(destination: CartView()) {
                            Text("Go to Cart")
                        }
                    }
                    
                    HStack(alignment:.top) {
                       
                        Button(action:{
                            showCheckout = true
                        })
                        {
                            Text("Buy now")
                                .font(.system(size: 21))
                                .bold()
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth:.infinity)
                                .background(backgroundColor(for: productsData.id))
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .padding(.horizontal,5)
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .ignoresSafeArea(.all)
                    
                    NavigationLink(destination: BuyNowView(product: productsData, quantity: quantity), isActive: $showCheckout) {
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.bottom)
                .background(Color.white)
                .mask(RoundedCorner(radius: 35, corners: [.topLeft]))
                .mask(RoundedCorner(radius: 35, corners: [.topRight]))
                .shadow(radius: 0.3)
                .ignoresSafeArea(.all)
            }
        }
        
        //  TOOL BAR
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                HStack(alignment:.top) {
                    
                    Spacer()
                    
                    Button(action: {
                        onTabLike.toggle()
                    })
                    {
                        Image(systemName: onTabLike ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(onTabLike ? .red : .black)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.trailing,7)
                        
                    }
                    
                    Button(action: {
                        isShowingShareSheet = true
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 20, height: 25)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $isShowingShareSheet) {
                        ShareSheet(items: ["Check out this product!", URL(string: "\(productsData.thumbnail)")!])
                    }
                    
                }
                .padding(.horizontal,5)

            }
        }
//        .toolbarBackground(backgroundColor(for: productsData.id), for: .navigationBar)
//        .toolbarBackground(.hidden, for: .navigationBar)
//        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

import SwiftUI
import UIKit

// Wrapper for the UIActivityViewController (Share Sheet)
struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any] // The items you want to share (text, images, URLs, etc.)
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No update required
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



class Cart: ObservableObject {
    struct CartItem: Identifiable {
        var id: Int { product.id }
        var product: ProductListModel.ProductResults
        var quantity: Int
    }
    
    @Published var items: [CartItem] = []
    
    // Add or update the cart with a specified quantity
    func addToCart(product: ProductListModel.ProductResults, quantity: Int) {
        // Check if the product is already in the cart
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            // If the product is already in the cart, update its quantity
            items[index].quantity += quantity
        } else {
            // If it's not in the cart, add it with the specified quantity
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeFromCart(product: ProductListModel.ProductResults) {
        items.removeAll { $0.product.id == product.id }
    }
}




//class Cart: ObservableObject {
//    @Published var items: [ProductListModel.ProductResults] = []
//    
//    func addToCart(product: ProductListModel.ProductResults) {
//        // Check if the product already exists in the cart
//        if !items.contains(where: { $0.id == product.id }) {
//            items.append(product) // Add only if it's not already in the cart
//        }
//    }
//    
//    func removeFromCart(product: ProductListModel.ProductResults) {
//        items.removeAll { $0.id == product.id }
//    }
//}
