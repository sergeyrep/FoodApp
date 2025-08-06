import Foundation

final class AddViewModel: ObservableObject {
  @Published var cartItem: [CartItem] = []
  //@Published var allProducts: [Products] = Products.sampleProducts
  
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
}
