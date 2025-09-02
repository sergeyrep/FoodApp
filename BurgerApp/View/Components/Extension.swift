import SwiftUI

extension View {
  func gradient() -> some View {
    self.background(
      LinearGradient( gradient: Gradient(colors: [.white, .reds, .color]),
        startPoint: .bottom,
        endPoint: .top
      )
      .ignoresSafeArea()
    )
  }
}

extension AnyTransition {
 static var slideFromRight: AnyTransition {
    AnyTransition.asymmetric(
    insertion: .move(edge: .trailing),
    removal: .move(edge: .leading)
   )
  }
}

extension View {
  func mainTitle(_ text: String, color: Color) -> some View {
    Text(text)
      .font(Font.custom(.lobster, size: 45))
      .foregroundColor(color)
  }
}

extension View {
  func textFieldStyle() -> some View {
    modifier(TextFieldStyle())
  }
}
