import SwiftUI

struct HomeScreen: View {
  @StateObject private var filterBar = FilterViewModel()
  @StateObject private var mainViewModel = MainViewModel()
  
  var body: some View {
    VStack {
      LabelBar()
      SearchBar()
      FilterBar(vm: filterBar)
        .onAppear {
          filterBar.mainViewModel = mainViewModel
        }
      ProductGrid()
        .environmentObject(mainViewModel)
    }
  }
}

#Preview {
  HomeScreen()
    .environmentObject(MainViewModel())
}
