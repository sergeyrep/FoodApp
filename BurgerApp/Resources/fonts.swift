import SwiftUI

enum CustomFonts: String {
  case lobster = "Lobster-Regular"
  case popins = "Poppins-Medium"
  case bold = "Poppins-Bold"
}

extension Font {
  static func custom(_ font: CustomFonts, size: Double) -> Font {
    Font.custom(font.rawValue, size: size)
  }
}
