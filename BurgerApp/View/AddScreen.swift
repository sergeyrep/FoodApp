import SwiftUI

struct AddScreen: View {
  @ObservedObject var addToCart: AddViewModel
  
  var body: some View {
    ScrollView {
      Text("Корзина")
        .font(Font.custom(.lobster, size: 45))
        .foregroundColor(.reds)
      VStack {
        ForEach(addToCart.cartItem) { item in
          HStack {
            Image(item.product.image)
              .resizable()
              .scaledToFit()
              .frame(width: 100, height: 100)
              .padding()
            
            Spacer()
            
            VStack {
              Text("\(item.product.name)")
                .font(.headline)
              Text("\(item.quantity) * \(item.product.price, specifier: "%.2f") ₽")
                .font(.caption)
            }
            
            Spacer()
            
//            IncreaseButton(portion: $portion)
          }
          .padding()
        }
        Text("\(addToCart.totalPrice, specifier: "%.2f") ₽")
          .font(.caption)
      }
    }
  }
}


