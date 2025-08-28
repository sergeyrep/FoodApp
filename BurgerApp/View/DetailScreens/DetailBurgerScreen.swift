import SwiftUI

struct DetailBurgerScreen: View {
  let product: Products
  @ObservedObject var favorite: FavoriteViewModel
  @ObservedObject var addToCart: AddViewModel
  @State var portion = 1
  
  var body: some View {
    VStack(spacing: 0) {
      DetailBurg(product: product, favorite: favorite)
      DetailParametr(portion: $portion)
      DetailButton(product: product, addToCart: addToCart, portion: $portion)
    }
  }
}

