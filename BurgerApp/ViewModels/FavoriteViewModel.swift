import Foundation

final class FavoriteViewModel: ObservableObject {
  @Published var favoriteProducts: [Products] = []
  @Published var allProducts: [Products] = Products.sampleProducts
  
  func favoriteProduct() {
    favoriteProducts = allProducts.filter { $0.favorite }
  }
}
