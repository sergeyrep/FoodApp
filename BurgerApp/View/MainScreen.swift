import SwiftUI

struct MainScreen: View {
  @StateObject var vm = MainViewModel()
  @StateObject var favorite = FavoriteViewModel()
  @StateObject var addToCart = AddViewModel()
  @StateObject var profile = ProfileViewModel()
  
  @Environment(\.managedObjectContext) private var context
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor.reds
  }
  
  var body: some View {
    TabView {
      NavigationStack {
        HomeScreen(mainViewModel: vm, favoriteViewModel: favorite, addToCart: addToCart)
      }
        .tabItem {
          Image(CustomImage.home)
          Text("*")
        }
        .tag(Tab.home)
      
      NavigationStack {
        ProfileScreen(viewModel: profile)
      }
        .tabItem {
          Image(CustomImage.user)
          Text("*")
        }
        .tag(Tab.profile)
      
      NavigationStack {
        AddScreen(addToCart: addToCart, favorite: favorite, context: context)
      }
        .tabItem {
          Image(CustomImage.plus)
          Text("*")
        }
        .tag(Tab.add)
      
      NavigationStack {
        MessageScreen()
      }
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
