import SwiftUI

struct DetailBurg: View {
  @ObservedObject var product: Products
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

#Preview {
  DetailBurg(product: .mock, favorite: .init())
}
