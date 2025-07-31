import SwiftUI
import Combine

@MainActor
final class MainViewModel: ObservableObject {
  @Published var allProducts: [Products] = [] // Все продукты
  @Published var filteredProducts: [Products] = [] // Отфильтрованные продукты
  @Published var selectedCategory: Category = .all
  //@Published var product: [Products] = Products.sampleProducts
  @Published var textSearch: String = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupBiindings()
  }
  
  func fetchData() async {
    do {
      if let downloadProduct = try await NetworkService.shared.downloadData() {
        allProducts = downloadProduct
        updateFilteredProducts()
      } else {
        print("Error fetching data")
      }
    } catch {
      print("Error fetching data: \(error)")
    }
  }
  
  private func setupBiindings() {
    $textSearch
      .debounce(for: 2, scheduler: RunLoop.main)
      .sink { [weak self] text in
        self?.updateFilteredProducts()
      }
      .store(in: &cancellables)
    
<<<<<<< HEAD
    func fetchData() async {
      guard let downloadProduct: [Products] = await NetworkService.shared.downloadData() else { return }
        DispatchQueue.main.async {
            self.allProducts = downloadProduct
            self.filteredProducts = downloadProduct
        }
=======
    $selectedCategory
      .sink { [weak self] _ in
        self?.updateFilteredProducts()
      }
      .store(in: &cancellables)
  }
  
  func updateFilteredProducts() {
    var result = allProducts
    
    if selectedCategory != .all {
      result = result.filter { $0.category == selectedCategory }
>>>>>>> 68d5f1d (q)
    }
    
    if !textSearch.isEmpty {
      result = result.filter {
        $0.name.localizedCaseInsensitiveContains(textSearch) ||
        $0.subName.localizedCaseInsensitiveContains(textSearch)
      }
    }
    filteredProducts = result
  }
  
  //  func serachProduct(by text: String) {
  //    if text.isEmpty {
  //      filteredProducts = allProducts
  //    } else {
  //      filteredProducts = allProducts.filter {
  //        $0.name.localizedCaseInsensitiveContains(text) ||
  //        $0.subName.localizedCaseInsensitiveContains(text)
  //      }
  //    }
  //  }
  //  
  //  func filterProducts(by category: Category) {
  //    if category == .all {
  //      filteredProducts = allProducts
  //    } else {
  //      filteredProducts = allProducts.filter { $0.category == category }
  //    }
  //  }
}
