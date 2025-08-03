import SwiftUI

struct SearchBar: View {
  @ObservedObject var vm: MainViewModel
  
  var body: some View {
    HStack {
      textField
        .overlay(
          resetSearchIcon,
          alignment: .leading
        )
        .overlay(
          resetSearch,
          alignment: .trailing
        )
      Button {
        
      } label: {
        Image(.iconSort)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
      }
    }
    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
  }
  
  @ViewBuilder
  private var textField: some View {
    TextField("Поиск бургера", text: $vm.textSearch)
      .frame(height: 40)
      .padding(.horizontal, 36)
      .padding(.vertical, 8)
      .background(Color(.white))
      .cornerRadius(20)
      .shadow(radius: 3)
  }
  
  @ViewBuilder
  private var resetSearchIcon: some View {
    Image(systemName: "magnifyingglass")
      .foregroundStyle(.gray)
      .padding(.leading, 4)
  }
  
  @ViewBuilder
  private var resetSearch: some View {
    if !vm.textSearch.isEmpty {
      Button {
        vm.textSearch = ""
        vm.filteredProducts = vm.allProducts
      } label: {
        Image(systemName: "xmark.circle")
          .foregroundStyle(.gray)
          .padding(.trailing, 4)
      }
    }
  }
}
