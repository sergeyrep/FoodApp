import SwiftUI
import CoreData

struct AddScreen: View {
  @ObservedObject var addToCart: AddViewModel
  @ObservedObject var favorite: FavoriteViewModel
  @StateObject private var orderVM: OrderViewModel
  
  @Environment(\.managedObjectContext) private var context
  
  init(
    addToCart: AddViewModel,
    favorite: FavoriteViewModel,
    context: NSManagedObjectContext
  ) {
    self.addToCart = addToCart
    self.favorite = favorite
    _orderVM = StateObject(wrappedValue: OrderViewModel(context: context))
  }
  
  var body: some View {
    ScrollView {
      navTitle
      VStack {
        if addToCart.cartItem.isEmpty {
          emptyAddView
        }
        ForEach($addToCart.cartItem) { $item in
          NavigationLink(
            destination:
              DetailBurgerScreen(
                product: item.product,
                favorite: favorite,
                addToCart: addToCart
              )
          ) {
            CartItemRow(
              item: $item,
              removeItem: { addToCart.removeItem(item) }
            )
          }
          Divider()
            .background(.gray)
        }
        Divider()
          .frame(height: 3)
          .background(.black)
      }
      totalPrice
    }
    orderButton
      .padding()
  }
  
  private var totalPrice: some View {
    Text("Сумма: \(addToCart.totalPrice, specifier: "%.2f") ₽")
      .font(Font.custom(.lobster, size: 25))
      .foregroundColor(.reds)
  }
  
  private var emptyAddView: some View {
    ContentUnavailableView(
      "Нет добавленных товаров",
      systemImage: "heart",
      description: Text("Добавьте товары в корзину, чтобы они появились здесь.")
    )
  }
  
  private var navTitle: some View {
    Text("Корзина")
      .font(Font.custom(.lobster, size: 45))
      .foregroundColor(.reds)
  }
  
  private var orderButton: some View {
    Button {
      saveOrdersToCoreData()
      addToCart.clearCart()
    } label: {
      Text("Оформить заказ")
        .font(Font.custom(.lobster, size: 25))
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .cornerRadius(20)
    }
  }
  
  private func saveOrdersToCoreData() {
    for item in addToCart.cartItem {
      orderVM
        .addOrder(
          name: item.product.name,
          quantity: Int16(item.quantity),
          price: item.product.price
        )
    }
  }
}

struct CartItemRow: View {
  @Binding var item: CartItem
  let removeItem: () -> Void
  
  var body: some View {
    HStack {
      Image(item.product.image)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .padding()
      
      Spacer()
      
      VStack {
        Text("\(item.product.name)")
          .font(Font.custom(.lobster, size: 27))
          .foregroundColor(.color)
        Divider()
        Spacer()
        HStack {
          Spacer()
          Button {
            if item.quantity > 1 {
              withAnimation(.easeInOut(duration: 0.2)) {
                item.quantity -= 1
              }
            } else {
              withAnimation {
                removeItem()
              }
            }
          } label: {
            Image(.minus)
              .frame(width: 10, height: 10)
              .foregroundColor(.reds)
          }
          Spacer()
          Text("\(item.quantity) * \(item.product.price, specifier: "%.2f") ₽")
            .font(Font.custom(.lobster, size: 20))
            .foregroundColor(.color)
          Spacer()
          Button {
            withAnimation(.easeInOut(duration: 0.2)) {
              item.quantity += 1
            }
          } label: {
            Image(.plus1)
              .foregroundColor(.reds)
              .frame(width: 8, height: 8)
          }
        }
      }
      .padding()
    }
  }
}


