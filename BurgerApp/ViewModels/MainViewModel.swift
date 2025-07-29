import SwiftUI

@MainActor
//final class MainViewModel: ObservableObject {
//  @Published var product: [Products] = Products.sampleProducts
//  
//  func changeBurger(_ products: Products) {
//    if let index = product.firstIndex(where: { $0.id == products.id }) {
//      product[index] = products
//    }
//  }
//  
//  func fetchData() async {
//    guard let downloadProduct: [Products] = await NetworkService.shared.downloadData() else { return }
//    
//    DispatchQueue.main.async {
//      self.product = downloadProduct
//    }
//  }
//}

class MainViewModel: ObservableObject {
    @Published var allProducts: [Products] = [] // Все продукты
    @Published var filteredProducts: [Products] = [] // Отфильтрованные продукты
    
    func fetchData() async {
        // Загрузка данных
      guard let downloadProduct: [Products] = await NetworkService.shared.downloadData() else { return }
        DispatchQueue.main.async {
            self.allProducts = downloadProduct
            self.filteredProducts = downloadProduct
        }
    }
    
    func filterProducts(by category: Category) {
        if category == .all {
            filteredProducts = allProducts
        } else {
            filteredProducts = allProducts.filter { $0.category == category }
        }
    }
}
