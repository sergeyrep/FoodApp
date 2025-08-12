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
  case burgerCola
  case diablo
  case avocado
  case bbq
  case black
  case cola
  case cesar
  case cheez
  case chokoKokteil
  case combo2
  case combo3
  case doubleBecon
  case eag
  case fish
  case friPotato
  case grek
  case kids
  case klubnich
  case luk
  case milk
  case mushroomBurger
  case set1
  case triple
  case vanilKok
  
}

extension Image {
  init (_ name: CustomImage) {
    self.init(name.rawValue)
  }
}
