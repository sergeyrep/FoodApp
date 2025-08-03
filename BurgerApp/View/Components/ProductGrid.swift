import SwiftUI

struct ProductGrid: View {  
  @ObservedObject var vm: MainViewModel
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
        ForEach(vm.filteredProducts) { product in
          ButtonBurger(product: product, onFavoriteToggle: {
            vm.toggleFavorite(for: product.id)
          })
        }
        .padding(.top, 2)
      }.padding(10)
    }
    .textInputAutocapitalization(.never)
    .onChange(of: vm.textSearch) { _, newValue in
      vm.updateFilteredProducts()
    }
    .overlay { noSeachrResult }
  }
  
  @ViewBuilder
  private var noSeachrResult: some View {
    if !vm.textSearch.isEmpty && vm.filteredProducts.isEmpty {
      ContentUnavailableView(
        "Поиск не дал результата",
        systemImage: "magnifyingglass",
        description: Text("\(vm.textSearch) пока нет, вы можете написать нам в соцсетях и мы добавим его")
      )
    }
  }
}

