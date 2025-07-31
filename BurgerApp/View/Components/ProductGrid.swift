import SwiftUI

struct ProductGrid: View {
  
  @ObservedObject var vm: MainViewModel
  
  init(vm: MainViewModel) {
    self._vm = ObservedObject(wrappedValue: vm)
    print("Init")
  }
  
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 0) {
        ForEach(vm.filteredProducts) { product in
          ButtonBurger(vm: product)
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
      }
    }
    .textInputAutocapitalization(.never)
    .onChange(of: vm.textSearch) { _, newValue in
      vm.updateFilteredProducts()
    }
    .overlay { noSeachrResult }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        if !vm.textSearch.isEmpty {
          Button("Сбросить") {
            resetSearch()
          }
        }
      }
    }
  }
  
  private func resetSearch() {
    vm.textSearch = ""
    vm.filteredProducts = vm.allProducts
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

