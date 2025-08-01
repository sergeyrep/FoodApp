import SwiftUI

struct ContentView: View {
  @StateObject var vm = MainViewModel()
  
    var body: some View {
      NavigationStack {
        MainScreen()
          .environmentObject(vm)
      }
    }
}

struct ContentViewMainScreen: View {
  @State private var isActive: Bool = false
  
  var body: some View {
    if isActive {
      ContentView()
    } else {
      ZStack {
        Color.white.ignoresSafeArea()
        
        VStack {
          Image(.mainscreen)
        }
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
              self.isActive = true
            }
          }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
