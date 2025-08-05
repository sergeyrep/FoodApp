import SwiftUI

struct HomeScreen: View {
  @StateObject private var mainViewModel = MainViewModel()
  @ObservedObject var favoriteViewModel: FavoriteViewModel
  
  var body: some View {
    VStack {
      LabelBar()
      SearchBar(vm: mainViewModel)
      FilterBar(vm: mainViewModel)
      ProductGrid(vm: mainViewModel, favorite: favoriteViewModel)
    }
  }
}

#Preview {
  HomeScreen(favoriteViewModel: .init())
}
