import Foundation

final class FavoriteViewModel: ObservableObject {
  @Published private(set) var favoriteProducts: [Products] = []
  @Published var allProducts: [Products] = Products.sampleProducts
  
  func toogleFavorite(for productID: UUID) {
    if let index = allProducts.firstIndex(where: { $0.id == productID }) {
      allProducts[index].favorite.toggle()
      favoriteProduct()
    }
  }
  
  func isFavorite(product: Products) -> Bool {
    favoriteProducts.contains(where: { $0.id == product.id })
  }
  
  func favoriteProduct() {
    favoriteProducts = allProducts.filter { $0.favorite }
  }
}
