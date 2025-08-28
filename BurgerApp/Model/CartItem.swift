import Foundation

struct CartItem: Identifiable, Equatable {
  let id = UUID()
  let product: Products
  var quantity: Int
  
}
