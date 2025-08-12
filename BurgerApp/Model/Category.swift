import Foundation

enum Category: String, CaseIterable, Identifiable {
  case all = "All"
  case combo = "Combo"
  case sleders = "Sleders"
  case classic = "Classic"
  case vegetarian = "Vegetarian"
  case sale = "Sale"
  case drinks = "Drinks"
  case spicy = "Spicy"
  case snacks = "Snacks"
  
  var id: String { rawValue }
}
