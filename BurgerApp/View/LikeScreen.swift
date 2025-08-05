import SwiftUI

struct LikeScreen: View {
  @StateObject var vm = FavoriteViewModel()
  @ObservedObject var mainVM: MainViewModel
  
  var body: some View {
    NavigationStack {
      contentView
        .navigationTitle("Избранное")
    }
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
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
        ForEach(vm.favoriteProducts) { product in
          ButtonBurger(
            product: product,
            favorite: vm,
            onFavoriteToggle: {
              mainVM.toggleFavorite(for: product.id)
            }
          )
          .contextMenu {
            Button(role: .destructive) {
              withAnimation {
                mainVM.toggleFavorite(for: product.id)
              }
            } label: {
              Label("Remove from favorites", systemImage: "heart.slash")
            }
          }
          .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
              withAnimation {
                mainVM.toggleFavorite(for: product.id)
              }
            } label: {
              Label("Удалить из избранного", systemImage: "heart.slash")
            }
          }
        }
      }
    }
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
  LikeScreen(vm: .init(), mainVM: .init())
}
