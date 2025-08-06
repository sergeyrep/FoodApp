import SwiftUI

struct MainScreen: View {
  @ObservedObject var vm: MainViewModel
  @ObservedObject var favorite: FavoriteViewModel
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor.reds
    self.vm = .init()
    self.favorite = .init()
  }
  
  var body: some View {
    TabView {
      HomeScreen(favoriteViewModel: favorite)
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
      
      AddScreen()
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
        LikeScreen(vm: favorite, mainVM: vm)
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
  HomeScreen(favoriteViewModel: .init())
}
