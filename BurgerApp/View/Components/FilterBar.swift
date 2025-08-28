import SwiftUI

struct FilterBar: View {
  @ObservedObject var vm: MainViewModel
  
  init(vm: MainViewModel) {
    self._vm = ObservedObject(wrappedValue: vm)
    print("InitFilterBar")
  }
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(Category.allCases, id: \.self) { category in
          Button(action: {
            vm.selectedCategory = category
            vm.updateFilteredProducts()
          }) {
            Text(category.rawValue)
              .frame(width: 75, height: 50)
              .font(.system(size: 14))
              .background(vm.selectedCategory == category ? Color.red : Color.G)
              .foregroundColor(vm.selectedCategory == category ? Color.white : Color.black)
              .cornerRadius(20)
          }
        }
      }
      .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
  }
}

