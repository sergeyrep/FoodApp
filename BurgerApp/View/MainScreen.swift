import SwiftUI

struct MainScreen: View {
  @EnvironmentObject var vM: MainViewModel
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor.reds
  }
  
  var body: some View {
    TabView {
      HomeScreen()
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
      
      LikeScreen()
        .tabItem {
          Image(CustomImage.heart)
          Text("*")
        }
        .tag(Tab.like)
    }
  }
}


#Preview {
  HomeScreen()
}
