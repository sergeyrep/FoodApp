import SwiftUI
import Combine

@MainActor
final class MainViewModel: ObservableObject {
  @Published private(set) var allProducts: [Products] = Products.sampleProducts
  @Published var filteredProducts: [Products] = []
  @Published var selectedCategory: Category = .all
  @Published var textSearch: String = ""
  @Published var products: [Products] = Products.sampleProducts
  
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
    
<<<<<<< HEAD
    func fetchData() async {
      guard let downloadProduct: [Products] = await NetworkService.shared.downloadData() else { return }
        DispatchQueue.main.async {
            self.allProducts = downloadProduct
            self.filteredProducts = downloadProduct
        }
=======
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
}

extension MainViewModel {
  func toggleFavorite(for productID: UUID) {
    if let product = allProducts.first(where: { $0.id == productID }) {
      product.favorite.toggle()
    }
  }
}
