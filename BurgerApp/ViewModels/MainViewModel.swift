import SwiftUI
import Combine

@MainActor
final class MainViewModel: ObservableObject {
  @Published var allProducts: [Products] = Products.sampleProducts
  @Published var filteredProducts: [Products] = []
  @Published var selectedCategory: Category = .all
  @Published var textSearch: String = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupBiindings()
    Task { await fetchData() }
  }
  
  func fetchData() async {
    do {
      let downloadProduct = try await NetworkService.shared.downloadData()
        allProducts = downloadProduct
        updateFilteredProducts()
    } catch {
      print("Error fetching data: \(error)")
    }
  }
  
  private func setupBiindings() {
    $textSearch
      .dropFirst()
      .removeDuplicates()
      .debounce(for: 0.5, scheduler: RunLoop.main)
      .sink { [weak self] text in
        self?.updateFilteredProducts()
      }
      .store(in: &cancellables)
    $selectedCategory
      .dropFirst()
      .removeDuplicates()
      .sink { [weak self] _ in
        self?.updateFilteredProducts()
      }
      .store(in: &cancellables)
  }
  
  func updateFilteredProducts() {
    var result = allProducts
    
    if selectedCategory != .all {
      result = result.filter { $0.category == selectedCategory }
    }
    
    if !textSearch.isEmpty {
      result = result.filter {
        $0.name.localizedCaseInsensitiveContains(textSearch) ||
        $0.subName.localizedCaseInsensitiveContains(textSearch)
      }
    }
    filteredProducts = result
  }
}

extension MainViewModel {
  func toggleFavorite(for productID: UUID) {
    if var product = allProducts.first(where: { $0.id == productID }) {
      product.favorite.toggle()
    }
  }
}

extension MainViewModel {
  
  func changeBurger(_ products: Products) {
    if let index = allProducts.firstIndex(where: { $0.id == products.id }) {
      allProducts[index] = products
    }
  }
}
