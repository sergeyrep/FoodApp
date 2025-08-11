import SwiftUI

struct ButtonBurger: View {
  
  @Binding var product: Products
  @ObservedObject var favorite: FavoriteViewModel
  @ObservedObject var addToCart: AddViewModel
  @State var animatedHeart: Bool = false
  var onFavoriteToggle: () -> Void
  
  private var favoriteButtonAnimated: Animation {
    .spring(response: 0.5, dampingFraction: 0.9)
  }
  
  var body: some View {
    NavigationLink(destination: DetailBurgerScreen(product: $product, favorite: favorite, addToCart: addToCart)) {
      productContent
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
    VStack(alignment: .leading, spacing: 8) {
      productImage
      productTitle
      ratingAndFavorite
    }
    .padding(10)
  }
  
  private var productImage: some View {
    HStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 120)
        .cornerRadius(10)
    }
    .frame(maxWidth: .infinity)
  }
  
  private var productTitle: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(product.name)
        .font(.headline)
        .foregroundColor(.black)
        .lineLimit(1)
      
      Text(product.subName)
        .font(.caption)
        .foregroundColor(.gray)
        .lineLimit(2)
    }
  }
  
  private var ratingAndFavorite: some View {
    HStack {
      ratingValue
      Spacer()
      LikeButton(favorite: favorite, product: $product)
    }
  }
  
  private var ratingValue: some View {
    HStack(spacing: 4) {
      Image(CustomImage.star)
      Text(product.rating)
        .font(.subheadline)
    }
  }
}


