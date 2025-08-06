import SwiftUI

struct AddScreen: View {
  @ObservedObject var addToCart: AddViewModel
  
  var body: some View {
    VStack {
      ForEach(addToCart.cartItem) { item in
        HStack {
          Image(item.product.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
          Spacer()
          
          Text("\(item.quantity) x \(item.product.name)")
        }
      }
    }
  }
}


