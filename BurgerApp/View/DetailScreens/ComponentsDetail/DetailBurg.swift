import SwiftUI

struct DetailBurg: View {
  let product: Products
  @ObservedObject var favorite: FavoriteViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      ZStack() {
        Image(product.image)
          .resizable()
          .scaledToFit()
      }
      Text(product.name)
        .font(.headline)
      HStack {
        Image(CustomImage.star)
        Text(product.rating)
        Spacer()
        Text("\(product.timeOfCooking)")
        LikeButton(favorite: favorite, product: product)
      }
      .padding()
      Text(product.subName)
    }
    .padding()
  }
}

