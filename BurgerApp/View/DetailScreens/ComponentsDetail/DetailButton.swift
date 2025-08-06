import SwiftUI

struct DetailButton: View {
  let product: Products
  @ObservedObject var addToCart: AddViewModel
  @Binding var portion: Int
  
  var totalPrice: Double {
    Double(portion) * product.price
  }
  
    var body: some View {
      HStack {
        Button(action: {}) {
          Text("₸\(totalPrice, specifier: "%.2f")")
        }
        .frame(width: 104, height: 70)
        .foregroundColor(.white)
        .background(.color)
        .cornerRadius(20)
        
        Spacer()
        Button(action: {
          addToCart.addToCart(product, quantity: portion)
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


