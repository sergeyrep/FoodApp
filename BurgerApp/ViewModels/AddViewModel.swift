import Foundation

final class AddViewModel: ObservableObject {
  @Published var cartItem: [CartItem] = []
  @Published var product: Products?
  
  func addToCart(_ product: Products, quantity: Int) {
    if let index = cartItem.firstIndex(where: { $0.product.id == product.id }) {
      cartItem[index].quantity += quantity
    } else {
      cartItem.append(CartItem(product: product, quantity: quantity))
    }
  }
  
  var totalPrice: Double {
    cartItem.reduce(0) { result, item in
      result + (item.product.price) * Double(item.quantity)
    }
  }
  
  func removeItem(_ item: CartItem) {
    if let index = cartItem.firstIndex(where: { $0.id == item.id }) {
        cartItem.remove(at: index)
    }
  }
  
  func increase(for itemId: UUID) {
    if let index = cartItem.firstIndex(where: { $0.product.id == itemId }) {
      cartItem[index].quantity += 1
    }
  }
}
