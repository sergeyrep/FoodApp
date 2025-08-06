import SwiftUI

struct LikeScreen: View {
  @StateObject var vm: FavoriteViewModel
  @ObservedObject var mainVM: MainViewModel
  @ObservedObject var addToCart: AddViewModel
  
  var body: some View {
    navTitle
    ScrollView {
      contentView
    }
  }
  
  //@ViewBuilder
  private var navTitle: some View {
    Text("Избранное")
      .font(Font.custom(.lobster, size: 45))
      .foregroundColor(.reds)
  }
  
  @ViewBuilder
  private var contentView: some View {
    if vm.favoriteProducts.isEmpty {
      emptyStateView
    } else {
      productsGrid
    }
  }
  
  private var productsGrid: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
      ForEach(vm.favoriteProducts) { product in
        ButtonBurger(
          product: product,
          favorite: vm, addToCart: addToCart,
          onFavoriteToggle: {
            withAnimation {
              mainVM.toggleFavorite(for: product.id)
            }
          }
        )
        .transition(.scale.combined(with: .opacity))
        .contextMenu {
          Button(role: .destructive) {
            withAnimation {
              mainVM.toggleFavorite(for: product.id)
            }
          } label: {
            Label("Remove from favorites", systemImage: "heart.slash")
          }
        }
      }
    }
    .animation(.easeInOut, value: vm.favoriteProducts)
  }
  
  
  private var emptyStateView: some View {
    ContentUnavailableView(
      "No favorites yet",
      systemImage: "heart",
      description: Text("Add some favorites to see them here")
    )
  }
}

#Preview {
  LikeScreen(vm: .init(), mainVM: .init(), addToCart: .init())
}
