import SwiftUI

struct DetailButton: View {
  let product: Products
  @ObservedObject var addToCart: AddViewModel
  @Binding var portion: Int
  @State private var cartBadgeOpacity = 0.0
  
  var totalPrice: Double {
    Double(portion) * product.price
  }
  
    var body: some View {
      HStack {
        Button(action: {}) {
          Text("\(totalPrice, specifier: "%.2f") ₽")
        }
        .frame(width: 104, height: 70)
        .foregroundColor(.white)
        .background(.color)
        .cornerRadius(20)
        
        Spacer()
        Button(action: {
          addToCart.addToCart(product, quantity: portion)
          
          withAnimation(.easeInOut(duration: 0.3)) {
            addToCart.showCartBadge = true
            cartBadgeOpacity = 1.0
          }
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 0.5)) {
              cartBadgeOpacity = 0.0
            }
          }
        }) {
          Text("Добавить в корзину")
        }
        .frame(width: 239, height: 70)
        .foregroundColor(.white)
        .background(.color)
        .cornerRadius(20)
      }
      .padding()
    }
}


