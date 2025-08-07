import SwiftUI

struct LikeButton: View {
  @ObservedObject var favorite: FavoriteViewModel
  @ObservedObject var product: Products
  
  @State private var animatedHeart: Bool = false
  
  private var favoriteButtonAnimated: Animation {
    .spring(response: 0.5, dampingFraction: 0.9)
  }
  
  var body: some View {
    Button {
      toogleFavorite()
      favorite.favoriteProduct()
    } label: {
      Image(systemName: product.favorite ? "heart.fill" : "heart")
        .symbolEffect(.bounce, value: product.favorite)
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

