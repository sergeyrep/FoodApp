import Foundation

enum Category: String, CaseIterable, Identifiable {
  case all = "All"
  case combo = "Combo"
  case sleders = "Sleders"
  case classic = "Classic"
  case vegetarian = "Vegetarian"
  case sale = "Sale"
  
  var id: String { rawValue }
}
