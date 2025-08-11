import SwiftUI

struct LikeButton: View {
  @ObservedObject var favorite: FavoriteViewModel
  let product: Products
  
  @State private var animatedHeart: Bool = false
  
  private var favoriteButtonAnimated: Animation {
    .spring(response: 0.5, dampingFraction: 0.9)
  }
  
  var body: some View {
    Button {
      toogleFavorite()
    } label: {
      Image(systemName: favorite.isFavorite(product: product) ? "heart.fill" : "heart")
        .symbolEffect(.bounce, value: favorite.isFavorite(product: product))
        .foregroundStyle(favorite.isFavorite(product: product) ? .red : .gray)
        .scaleEffect(animatedHeart ? 1.5 : 1)
    }
  }
  
  private func toogleFavorite() {
    withAnimation(favoriteButtonAnimated) {
      favorite.toogleFavorite(for: product.id)
      animatedHeart = true
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      withAnimation {
        animatedHeart = false
      }
    }
  }
}

