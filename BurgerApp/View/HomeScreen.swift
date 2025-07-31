import SwiftUI

struct HomeScreen: View {
  @StateObject private var mainViewModel = MainViewModel()
  
  var body: some View {
    VStack {
      LabelBar()
      SearchBar(vm: mainViewModel)
      FilterBar(vm: mainViewModel)
      ProductGrid(vm: mainViewModel)
    }
  }
}

#Preview {
  HomeScreen()
    .environmentObject(MainViewModel())
}
