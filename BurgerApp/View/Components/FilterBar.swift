import SwiftUI

struct FilterBar: View {
  @StateObject var vm: FilterViewModel
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(Category.allCases, id: \.self) { category in
          Button(action: {
            vm.selectedCategory = category
            vm.changeProducts()
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
      .padding()
    }
  }
}

#Preview {
  FilterBar(vm: FilterViewModel())
}
