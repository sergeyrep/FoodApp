import SwiftUI

struct MainScreen: View {
  @StateObject var vm = MainViewModel()
  @StateObject var favorite = FavoriteViewModel()
  @StateObject var addToCart = AddViewModel()
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor.reds
  }
  
  var body: some View {
    TabView {
      HomeScreen(mainViewModel: vm, favoriteViewModel: favorite, addToCart: addToCart)
        .tabItem {
          Image(CustomImage.home)
          Text("*")
        }
        .tag(Tab.home)
      
      ProfileScreen()
        .tabItem {
          Image(CustomImage.user)
          Text("*")
        }
        .tag(Tab.profile)
      
      NavigationStack {
        AddScreen(addToCart: addToCart, favorite: favorite)
      }
        .tabItem {
          Image(CustomImage.plus)
          Text("*")
        }
        .tag(Tab.add)
      
      MessageScreen()
        .tabItem {
          Image(CustomImage.comment)
          Text("*")
        }
      
      NavigationStack {
        LikeScreen(vm: favorite, mainVM: vm, addToCart: addToCart)
      }
        .tabItem {
          Image(CustomImage.heart)
          Text("*")
        }
        .tag(Tab.like)
    }
  }
}


#Preview {
  HomeScreen(mainViewModel: .init(), favoriteViewModel: .init(), addToCart: .init())
}
