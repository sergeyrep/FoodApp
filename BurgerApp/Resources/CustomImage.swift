import SwiftUI

enum CustomImage: String {
  case home
  case user
  case heart
  case plus
  case comment
  case Burger1
  case Burger2
  case Burger3
  case Burger4
  case bigBurger1
  case bigBurger2
  case bigBurger3
  case bigBurger4
  case star
}

extension Image {
  init (_ name: CustomImage) {
    self.init(name.rawValue)
  }
}
