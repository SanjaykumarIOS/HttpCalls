
import SwiftUI
import SDWebImage

struct CartView: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        List {
            ForEach(cart.items) { cartItem in
                HStack {
                    Text(cartItem.product.title)
                        .font(.headline)
                    
                  Spacer()
                    
                    Text("Quantity: \(cartItem.quantity)")
                        .font(.subheadline)
                    
                    // Remove Button
                    Button(action: {
                        cart.removeFromCart(product: cartItem.product)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.leading, 10)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Cart")
    }
}





