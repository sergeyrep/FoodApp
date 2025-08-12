import SwiftUI

struct ButtonBurger: View {
  
  let product: Products
  @ObservedObject var favorite: FavoriteViewModel
  @ObservedObject var addToCart: AddViewModel
  @State var animatedHeart: Bool = false
  var onFavoriteToggle: () -> Void
  
  private var favoriteButtonAnimated: Animation {
    .spring(response: 0.5, dampingFraction: 0.9)
  }
  
  var body: some View {
    NavigationLink(
      destination: DetailBurgerScreen(
        product: product,
        favorite: favorite,
        addToCart: addToCart
      )
    ) {
      ZStack {
        productContent
        LikeButton(favorite: favorite, product: product)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
          .padding()
      }
    }
    .buttonStyle(.plain)
    .frame(maxWidth: 185, maxHeight: 225)
    .background(.white)
    .cornerRadius(20)
    .shadow(radius: 10)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
      .stroke(Color.gray.opacity(0.2), lineWidth: 1)
    )
  }
  
  private var productContent: some View {
    VStack(alignment: .center, spacing: 8) {
      productImage
      productTitle
        .frame(maxWidth: .infinity, alignment: .leading)
      priceAndRatingProduct
    }
    .padding(10)
  }
  
  private var productImage: some View {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 120)
        .cornerRadius(10)
        .padding(8)
  }
  
  private var productTitle: some View {
      Text(product.name)
        .font(.caption)
        .foregroundColor(.black)
        .frame(maxHeight: .infinity)
        .lineLimit(2)
        .fixedSize(horizontal: false, vertical: true)
                .frame(minHeight: 40)
  }
  
  private var priceAndRatingProduct: some View {
    HStack(spacing: 0) {
      ratingValue
      Spacer()
      Text("\(product.price, specifier: "%.2f") ₽")
        .font(.caption)
        .lineLimit(2)
    }
  }
  
  private var ratingValue: some View {
    HStack(spacing: 0) {
      Image(CustomImage.star)
      Text(product.rating)
        .font(.caption)
    }
  }
}



