import SwiftUI

//class FilterViewModel: ObservableObject {
//  @Published var selectedCategory: Category = .all
//  @Published var product: [Products] = Products.sampleProducts
//  
//  func changeProducts() {
//    self.product = Products.sampleProducts.filter { product in
//      if selectedCategory == .all {
//        return true
//      }
//      return product.category == selectedCategory
//    }
//  }
//}
class FilterViewModel: ObservableObject {
    @Published var selectedCategory: Category = .all
    weak var mainViewModel: MainViewModel? // Ссылка на MainViewModel
    
  @MainActor func changeProducts() {
        mainViewModel?.filterProducts(by: selectedCategory)
    }
}
