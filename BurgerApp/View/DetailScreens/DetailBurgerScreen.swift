import SwiftUI

struct DetailBurgerScreen: View {
  var vm: Products
  
  var body: some View {
    VStack(spacing: 0) {
      NavBar()
      DetailBurg(vm: vm)
      DetailParametr()
      DetailButton(vm: vm)
    }
    .navigationBarBackButtonHidden()
  }
}


#Preview {
  DetailBurgerScreen(vm: .mock)
}
