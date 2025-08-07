import SwiftUI

struct HomeScreen: View {
  @ObservedObject var mainViewModel: MainViewModel
  @ObservedObject var favoriteViewModel: FavoriteViewModel
  @ObservedObject var addToCart: AddViewModel
  
  var body: some View {
    VStack {
      LabelBar()
      SearchBar(vm: mainViewModel)
      FilterBar(vm: mainViewModel)
      ProductGrid(vm: mainViewModel, favorite: favoriteViewModel, addToCart: addToCart)
    }
  }
}

#Preview {
  HomeScreen(mainViewModel: .init(), favoriteViewModel: .init(), addToCart: .init())
}
