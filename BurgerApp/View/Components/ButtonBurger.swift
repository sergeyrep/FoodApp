import SwiftUI

struct ButtonBurger: View {
  
  @ObservedObject var product: Products
  @State var animatedHeart: Bool = false
  var onFavoriteToggle: () -> Void
  
  private var favoriteButtonAnimated: Animation {
    .spring(response: 0.5, dampingFraction: 0.9)
  }
  
  var body: some View {
    NavigationLink(destination: DetailBurgerScreen(vm: product)) {
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
    Image(product.image)
      .resizable()
      .scaledToFit()
      .frame(width: 120, height: 120)
      .cornerRadius(10)
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
      favoriteButton
    }
  }
  
  private var ratingValue: some View {
    HStack(spacing: 4) {
      Image(CustomImage.star)
      Text(product.rating)
        .font(.subheadline)
    }
  }
  
  private var favoriteButton: some View {
    Button {
      toogleFavorite()
    } label: {
      Image(systemName: product.favorite ? "heart.fill" : "heart")
        .foregroundStyle(product.favorite ? .red : .gray)
        .scaleEffect(animatedHeart ? 1.5 : 1)
    }
  }
  
  private func toogleFavorite() {
    withAnimation(favoriteButtonAnimated) {
      product.favorite.toggle()
      animatedHeart = true
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      withAnimation {
        animatedHeart = false
      }
    }
  }
}

#Preview {
  ButtonBurger(product: Products.mock, onFavoriteToggle: {})
}
