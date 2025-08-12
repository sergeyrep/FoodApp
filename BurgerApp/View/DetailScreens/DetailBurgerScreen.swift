//import SwiftUI
//
//struct DetailBurgerScreen: View {
//  let product: Products
//  @ObservedObject var favorite: FavoriteViewModel
//  @ObservedObject var addToCart: AddViewModel
//  @State var portion = 1
//
//  var body: some View {
//    ZStack {
//      VStack(spacing: 0) {
//        DetailBurg(product: product, favorite: favorite)
//        DetailParametr(portion: $portion)
//        DetailButton(product: product, addToCart: addToCart, portion: $portion)
//      }
//      if addToCart.showCartBadge {
//        NavigationLink(destination: AddScreen(addToCart: addToCart, favorite: favorite)) {
//          HStack(spacing: 8) {
//            Image(CustomImage.plus)
//              .resizable()
//              .aspectRatio(contentMode: .fit)
//              .frame(width: 24, height: 24)
//
//            Text("\(addToCart.totalItems)")
//              .font(.system(size: 14, weight: .bold, design: .rounded))
//              .foregroundColor(.white)
//              .padding(.horizontal, 5)
//              .padding(.vertical, 5)
//              .background(Circle().fill(Color.red))
//              .frame(minWidth: 24)
//          }
//          .padding(.horizontal, 5)
//          .padding(.vertical, 5)
//          .background(
//            Capsule()
//              .fill(Color.color)
//              .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2))
//        }
//      }
//    }
//  }
//}
//
//#Preview {
//  DetailBurgerScreen(product: .mock, favorite: .init(), addToCart: .init(), portion: 1)
//}
import SwiftUI

struct DetailBurgerScreen: View {
  let product: Products
  @ObservedObject var favorite: FavoriteViewModel
  @ObservedObject var addToCart: AddViewModel
  @State var portion = 1
  
  var body: some View {
      VStack { // Выравнивание по нижнему краю
        VStack(spacing: 0) {
          DetailBurg(product: product, favorite: favorite)
          DetailParametr(portion: $portion)
          DetailButton(product: product, addToCart: addToCart, portion: $portion)
          
          Spacer()
        }
        
        if addToCart.showCartBadge {
          cartBadgeView
            .transition(.move(edge: .bottom).combined(with: .slide))
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: addToCart.showCartBadge)
            .padding(.bottom, 20)
      }
    }
  }
  
  private var cartBadgeView: some View {
    NavigationLink(destination: AddScreen(addToCart: addToCart, favorite: favorite)) {
      HStack(spacing: 12) {
        Image(systemName: "cart.fill")
          .font(.system(size: 20))
          .foregroundColor(.white)
        
        Text("\(addToCart.totalItems) товар(а) · \(addToCart.totalPrice, specifier: "%.2f") ₽")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
        
        Spacer()
        
        Image(systemName: "chevron.right")
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.7))
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 15)
      .background(
        RoundedRectangle(cornerRadius: 25)
          .fill(Color.color)
          .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
      )
      .padding(.horizontal, 20)
    }
    .buttonStyle(PlainButtonStyle())
  }
}


#Preview {
  DetailBurgerScreen(product: .mock, favorite: .init(), addToCart: .init(), portion: 1)
}
